// Copyright 2011 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package os

func isExist(err error) bool {
	if err == nil {
		return false
	}
	if pe, ok := err.(*PathError); ok {
		err = pe.Err
	}
	return contains(err.Error(), " exists")
}

func isNotExist(err error) bool {
	if err == nil {
		return false
	}
	if pe, ok := err.(*PathError); ok {
		err = pe.Err
	}
	return contains(err.Error(), "does not exist")
}

func isPermission(err error) bool {
	if err == nil {
		return false
	}
	if pe, ok := err.(*PathError); ok {
		err = pe.Err
	}
	return contains(err.Error(), "permission denied")
}

// contains is a local version of strings.Contains. It knows len(sep) > 1.
func contains(s, sep string) bool {
	n := len(sep)
	c := sep[0]
	for i := 0; i+n <= len(s); i++ {
		if s[i] == c && s[i:i+n] == sep {
			return true
		}
	}
	return false
}
