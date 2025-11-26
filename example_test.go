package ver_example

import "testing"

func TestSwap(t *testing.T) {
	x, y := 2, 3
	Swap(&x, &y)
	if x != 3 {
		panic("Swap is incorrect")
	}
}
