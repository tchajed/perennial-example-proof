package ver_example

func Swap(x, y *int) {
	*x, *y = *y, *x
}
