package oib

import (
	"regexp"
	"strconv"
)

func IsValid(code string) bool {
	match, err := regexp.MatchString("^[0-9]{11}$", code)
	if err != nil {
		return false
	}

	if !match {
		return false
	}

	checksum := 10
	for i := 0; i < 10; i++ {
		n, _ := strconv.Atoi(string(code[i]))

		checksum += n
		checksum %= 10
		if checksum == 0 {
			checksum = 10
		}

		checksum *= 2
		checksum %= 11
	}

	checksum = 11 - checksum
	if checksum == 10 {
		checksum = 0
	}

	last, _ := strconv.Atoi(string(code[10]))

	return checksum == last
}
