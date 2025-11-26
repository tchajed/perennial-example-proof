package ver_example

func Swap(x, y *int) {
	*x, *y = *y, *x
}

func UseSwap(x *int) {
	var z int
	Swap(x, &z)
}
