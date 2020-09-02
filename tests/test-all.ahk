SetBatchLines, -1
#SingleInstance, force
#NoTrayIcon
#Include %A_ScriptDir%\..\export.ahk
#Include %A_ScriptDir%\..\node_modules
#Include unit-testing.ahk\export.ahk

assert := new unittesting()
table := new instantlookupset()

; create
assert.label("create - add values")
assert.test(table.create("bill"), 1)
assert.test(table.create("ted"), 2)

assert.label("create - add multiple values")
assert.test(table.create("socrates", "lincoln"), 4)

assert.label("create - add array of values")
table.clear()
assert.test(table.create(["bill", "ted"]), 2)



assert.label("push - add values")
assert.test(table.push("socrates"), 3)
assert.label("push - add pre-existing value")
assert.test(table.push("socrates"), 3)


; read
assert.label("find - lookup")
assert.true(table.find("bill"))
assert.true(table.find("ted"))
assert.true(table.find("socrates"))
assert.false(table.find("me"))
assert.label("indexOf - lookup different Case")
assert.true(table.find("Bill"))



assert.label("indexOf - lookup")
assert.test(table.indexOf("bill"), 1)
assert.test(table.indexOf("ted"), 2)
assert.test(table.indexOf("socrates"), 3)
assert.test(table.indexOf("me"), -1)
assert.label("indexOf - lookup different Case")
assert.test(table.indexOf("Bill"), 1)


assert.label("allData - display all keys")
assert.test(table.allData(), ["bill", "socrates", "ted"])



; delete
assert.label("delete - delete at 'start'")
assert.test(table.delete("bill"), 2)
assert.label("delete - delete at 'end'")
assert.test(table.delete("socrates"), 1)
assert.test(table.delete("ted"), 0)
assert.test(table.index, 1) ; not 0 because we removed bill before working on end of table



; update
assert.label("reIndex - return new count")
assert.test(table.reIndex(), 0)
table.create(["bill", "ted", "socrates"])
table.delete("bill")
assert.test(table.reIndex(), 2)
assert.test(table.allData(), ["socrates", "ted"])
assert.test(table.index, 2)



;; Display test results in GUI
assert.fullReport()
assert.writeTestResultsToFile()

ExitApp
