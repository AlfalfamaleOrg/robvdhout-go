// Copyright 2011 The Go Authors.  All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package http

import (
	"bytes"
	"runtime"
	"testing"
)

var headerWriteTests = []struct {
	h        Header
	exclude  map[string]bool
	expected string
}{
	{Header{}, nil, ""},
	{
		Header{
			"Content-Type":   {"text/html; charset=UTF-8"},
			"Content-Length": {"0"},
		},
		nil,
		"Content-Length: 0\r\nContent-Type: text/html; charset=UTF-8\r\n",
	},
	{
		Header{
			"Content-Length": {"0", "1", "2"},
		},
		nil,
		"Content-Length: 0\r\nContent-Length: 1\r\nContent-Length: 2\r\n",
	},
	{
		Header{
			"Expires":          {"-1"},
			"Content-Length":   {"0"},
			"Content-Encoding": {"gzip"},
		},
		map[string]bool{"Content-Length": true},
		"Content-Encoding: gzip\r\nExpires: -1\r\n",
	},
	{
		Header{
			"Expires":          {"-1"},
			"Content-Length":   {"0", "1", "2"},
			"Content-Encoding": {"gzip"},
		},
		map[string]bool{"Content-Length": true},
		"Content-Encoding: gzip\r\nExpires: -1\r\n",
	},
	{
		Header{
			"Expires":          {"-1"},
			"Content-Length":   {"0"},
			"Content-Encoding": {"gzip"},
		},
		map[string]bool{"Content-Length": true, "Expires": true, "Content-Encoding": true},
		"",
	},
	{
		Header{
			"Nil":          nil,
			"Empty":        {},
			"Blank":        {""},
			"Double-Blank": {"", ""},
		},
		nil,
		"Blank: \r\nDouble-Blank: \r\nDouble-Blank: \r\n",
	},
	// Tests header sorting when over the insertion sort threshold side:
	{
		Header{
			"k1": {"1a", "1b"},
			"k2": {"2a", "2b"},
			"k3": {"3a", "3b"},
			"k4": {"4a", "4b"},
			"k5": {"5a", "5b"},
			"k6": {"6a", "6b"},
			"k7": {"7a", "7b"},
			"k8": {"8a", "8b"},
			"k9": {"9a", "9b"},
		},
		map[string]bool{"k5": true},
		"k1: 1a\r\nk1: 1b\r\nk2: 2a\r\nk2: 2b\r\nk3: 3a\r\nk3: 3b\r\n" +
			"k4: 4a\r\nk4: 4b\r\nk6: 6a\r\nk6: 6b\r\n" +
			"k7: 7a\r\nk7: 7b\r\nk8: 8a\r\nk8: 8b\r\nk9: 9a\r\nk9: 9b\r\n",
	},
}

func TestHeaderWrite(t *testing.T) {
	var buf bytes.Buffer
	for i, test := range headerWriteTests {
		test.h.WriteSubset(&buf, test.exclude)
		if buf.String() != test.expected {
			t.Errorf("#%d:\n got: %q\nwant: %q", i, buf.String(), test.expected)
		}
		buf.Reset()
	}
}

type hasTokenTest struct {
	header string
	token  string
	want   bool
}

var hasTokenTests = []hasTokenTest{
	{"", "", false},
	{"", "foo", false},
	{"foo", "foo", true},
	{"foo ", "foo", true},
	{" foo", "foo", true},
	{" foo ", "foo", true},
	{"foo,bar", "foo", true},
	{"bar,foo", "foo", true},
	{"bar, foo", "foo", true},
	{"bar,foo, baz", "foo", true},
	{"bar, foo,baz", "foo", true},
	{"bar,foo, baz", "foo", true},
	{"bar, foo, baz", "foo", true},
	{"FOO", "foo", true},
	{"FOO ", "foo", true},
	{" FOO", "foo", true},
	{" FOO ", "foo", true},
	{"FOO,BAR", "foo", true},
	{"BAR,FOO", "foo", true},
	{"BAR, FOO", "foo", true},
	{"BAR,FOO, baz", "foo", true},
	{"BAR, FOO,BAZ", "foo", true},
	{"BAR,FOO, BAZ", "foo", true},
	{"BAR, FOO, BAZ", "foo", true},
	{"foobar", "foo", false},
	{"barfoo ", "foo", false},
}

func TestHasToken(t *testing.T) {
	for _, tt := range hasTokenTests {
		if hasToken(tt.header, tt.token) != tt.want {
			t.Errorf("hasToken(%q, %q) = %v; want %v", tt.header, tt.token, !tt.want, tt.want)
		}
	}
}

func BenchmarkHeaderWriteSubset(b *testing.B) {
	doHeaderWriteSubset(b.N, b)
}

func TestHeaderWriteSubsetMallocs(t *testing.T) {
	doHeaderWriteSubset(100, t)
}

type errorfer interface {
	Errorf(string, ...interface{})
}

func doHeaderWriteSubset(n int, t errorfer) {
	h := Header(map[string][]string{
		"Content-Length": {"123"},
		"Content-Type":   {"text/plain"},
		"Date":           {"some date at some time Z"},
		"Server":         {"Go http package"},
	})
	var buf bytes.Buffer
	var m0 runtime.MemStats
	runtime.ReadMemStats(&m0)
	for i := 0; i < n; i++ {
		buf.Reset()
		h.WriteSubset(&buf, nil)
	}
	var m1 runtime.MemStats
	runtime.ReadMemStats(&m1)
	if mallocs := m1.Mallocs - m0.Mallocs; n >= 100 && mallocs >= uint64(n) {
		// TODO(bradfitz,rsc): once we can sort with allocating,
		// make this an error.  See http://golang.org/issue/3761
		// t.Errorf("did %d mallocs (>= %d iterations); should have avoided mallocs", mallocs, n)
	}
}
