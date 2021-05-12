class instantlookupset {

	; --- Constructor, Destructor, Meta-Functions ---
	__New() {
		this.data := []
		this.index := 0
	}


	; --- Static Methods ---

	; create
	create(param_values*) {
		savedBatchLines := A_BatchLines
		SetBatchLines, -1

		; prepare
		if (!IsObject(this.data)) {
			this.clear()
		}

		; create
		for _, value in param_values {
			if (IsObject(value)) {
				for _, element in value {
					if (!this.find(element)) {
						this.index++
					}
					this.data[element] := this.index
				}
			} else {
				if (!this.find(value)) {
					this.index++
				}
				this.data[value] := this.index
			}
		}

		SetBatchLines, % savedBatchLines
		return this.data.Count()
	}

	push(param_values*) {
		return this.create(param_values)
	}

	; read
	read(param_value) {
		if (this.data[param_value] != "") {
			return this.data[param_value]
		}
		return false
	}

	find(param_value) {
		if (this.data[param_value] != "") {
			return true
		}
		return false
	}

	indexOf(param_value) {
		if (this.data.HasKey(param_value)) {
			return this.data[param_value]
		}
		return -1
	}

	allData() {
		if (!IsObject(this.data)) {
			this.clear()
		}
		l_array := []
		for key, _ in this.data {
			l_array.push(key)
		}
		return l_array
	}

	; update
	update(param_key, param_value:="") {
		if (!IsObject(this.data)) {
			this.clear()
		}

		; prepare
		if (param_value == "") {
			this.index++
			param_value := this.index
		}

		this.data[param_key] := param_value
	}

	reIndex() {
		if (!IsObject(this.data)) {
			this.clear()
		}

		this.index := 0
		newData := []
		for key, value in this.data {
			this.index++
			newData[key] := this.index
		}
		this.data := newData.Clone()
		return this.data.Count()
	}

	; delete
	delete(param_values*) {
		savedBatchLines := A_BatchLines
		SetBatchLines, -1

		for _, value in param_values {
			if (IsObject(value)) {
				for _, element in value {
					if (this.data[element] == this.index) {
						this.index--
					}
					this.data.Delete(element)
				}
			} else {
				if (this.data[value] == this.index) {
					this.index--
				}
				this.data.Delete(value)
			}
		}

		SetBatchLines, % savedBatchLines
		return this.data.Count()
	}

	clear() {
		this.data := []
		this.index := 0
	}
}
