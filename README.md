# instantlookupset.ahk

===========

A package for instant lookup style arrays.


## Installation
In a terminal or command line navigated to your project folder:
```bash
npm install instantlookupset.ahk
```

In your code:
```autohotkey
#Include %A_ScriptDir%\node_modules
#Include instantlookupset.ahk\export.ahk
table := new instantlookupset()

table.push("leo", "donny", "raph")
table.read("raph")
; => 3

table.find("raph")
; => true
```
You may also review or copy the library from [./export.ahk on GitHub](https://github.com/Chunjee/instantlookupset.ahk); #Include as you would normally when manually downloading.


## Usage
Grants access to a class named `instantlookupset` with the following methods: `.create`, `.push`, `.read`, `.find`, `.indexOf`, `.allData`, `.update`, `.reIndex`, `.delete`, and `.clear`


## Reasoning
AutoHotkey array traversing is not exactly quick. One common solution when speed is a big concern is to store the data as the key, and a `1` as the value. Then checking if the key exists and has a value is semi-instant.

This creates a small readability problem because often it is used in conjunction with a regular array for the data; since keys are always turned lowercase. So it can read a bit confusing having two arrays with one being used in an unusual way.

The goal of this package is to get similiar functionality; without having to use an array backwards.


## API
Follows CRUD operations (create, read, update, delete)


### Create
`.create` and `.push`

### Read
`.read`, `.find`, `.indexOf`, and `.allData`

### Update
`.update` and `.reIndex`

### Delete
`.delete` and `.clear`
