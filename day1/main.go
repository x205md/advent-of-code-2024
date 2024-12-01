package main

import (
	"bufio"
	"fmt"
	"log"
	"math"
	"os"
	"sort"
	"strconv"
	"strings"
)

func main() {
	file, err := os.Open("./input.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	var left []int
	var right []int

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		fields := strings.Fields(line)

		l, _ := strconv.Atoi(fields[0])
		left = append(left, l)

		r, _ := strconv.Atoi(fields[1])
		right = append(right, r)
	}

	sort.Ints(left)
	sort.Ints(right)

	acc := 0.0
	for i, l := range left {
		acc += math.Abs(float64(l - right[i]))
	}

	fmt.Println("Disance : ", int(acc))
}
