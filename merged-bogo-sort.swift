//マージドボゴソート
let n = 15
let range = 1...1000
var a: [Int] = []

for _ in 0..<n {
	a.append(Int.random(in: range))
}

print(a)
sort(l: 0, r: n - 1)

func select(all: Int, on: Int) -> [Bool] {
	var returnBools = [Bool](repeating: false, count: all)
	var counter = 0
	while true {
		let target = Int.random(in: 0..<all)
		if returnBools[target] == false {
			returnBools[target] = true
			counter += 1
			if counter == on {
				break
			}
		}
	}
	return returnBools
}

func sort(l: Int, r: Int) {
	print("sort", l, r)
	if l == r {
		return
	} else {
		let half = (r + l) / 2
		sort(l: l, r: half)
		sort(l: half + 1, r: r)
	orderLoop:
		while true {
			var lIndex = l
			var rIndex = half + 1
			let order = select(all: r - l + 1, on: half - l + 1)
			var current = -1
			for b in order {
				if b {
					if a[lIndex] < current {
						continue orderLoop
					}
					current = a[lIndex]
					lIndex += 1
				} else {
					if a[rIndex] < current {
						continue orderLoop
					}
					current = a[rIndex]
					rIndex += 1
				}
			}
			var newArray: [Int] = []
			lIndex = l
			rIndex = half + 1
			for b in order {
				if b {
					newArray.append(a[lIndex])
					lIndex += 1
				} else {
					newArray.append(a[rIndex])
					rIndex += 1
				}
			}
			print(newArray)
			a.replaceSubrange(l...r, with: newArray)
			break
		}
	}
}
