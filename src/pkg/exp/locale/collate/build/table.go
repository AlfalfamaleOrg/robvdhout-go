// Copyright 2012 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package build

import (
	"fmt"
	"io"
	"reflect"
)

// table is an intermediate structure that roughly resembles the table in collate.
// It implements the non-exported interface collate.tableInitializer
type table struct {
	index trie // main trie

	// expansion info
	expandElem []uint32

	// contraction info
	contractTries  contractTrieSet
	contractElem   []uint32
	maxContractLen int
}

func (t *table) TrieIndex() []uint16 {
	return t.index.index
}

func (t *table) TrieValues() []uint32 {
	return t.index.values
}

func (t *table) ExpandElems() []uint32 {
	return t.expandElem
}

func (t *table) ContractTries() []struct{ l, h, n, i uint8 } {
	return t.contractTries
}

func (t *table) ContractElems() []uint32 {
	return t.contractElem
}

func (t *table) MaxContractLen() int {
	return t.maxContractLen
}

// print writes the table as Go compilable code to w. It prefixes the
// variable names with name. It returns the number of bytes written
// and the size of the resulting table.
func (t *table) print(w io.Writer, name string) (n, size int, err error) {
	update := func(nn, sz int, e error) {
		n += nn
		if err == nil {
			err = e
		}
		size += sz
	}
	p := func(f string, a ...interface{}) {
		nn, e := fmt.Fprintf(w, f, a...)
		update(nn, 0, e)
	}
	// Write main table.
	size += int(reflect.TypeOf(*t).Size())
	p("var %sTable = table{\n", name)
	update(t.index.printStruct(w, name))
	p(",\n")
	p("%sExpandElem[:],\n", name)
	update(t.contractTries.printStruct(w, name))
	p(",\n")
	p("%sContractElem[:],\n", name)
	p("%d,\n", t.maxContractLen)
	p("}\n\n")

	// Write arrays needed for the structure.
	update(printColElems(w, t.expandElem, name+"ExpandElem"))
	update(printColElems(w, t.contractElem, name+"ContractElem"))
	update(t.index.printArrays(w, name))
	update(t.contractTries.printArray(w, name))

	p("// Total size of %sTable is %d bytes\n", name, size)
	return
}

func printColElems(w io.Writer, a []uint32, name string) (n, sz int, err error) {
	p := func(f string, a ...interface{}) {
		nn, e := fmt.Fprintf(w, f, a...)
		n += nn
		if err == nil {
			err = e
		}
	}
	sz = len(a) * int(reflect.TypeOf(uint32(0)).Size())
	p("// %s: %d entries, %d bytes\n", name, len(a), sz)
	p("var %s = [%d]uint32 {", name, len(a))
	for i, c := range a {
		switch {
		case i%64 == 0:
			p("\n\t// Block %d, offset 0x%x\n", i/64, i)
		case (i%64)%6 == 0:
			p("\n\t")
		}
		p("0x%.8X, ", c)
	}
	p("\n}\n\n")
	return
}
