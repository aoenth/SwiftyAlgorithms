//
//  SelectionSort.swift
//  
//
//  Created by Kevin Peng on 2022-02-14.
//

import Foundation

public struct SortingAlgorithms {
    public static func selectionSort<T: Comparable>(input: [T]) -> [T] {
        // for each index from 0 to input.count - 1
        // set minIndex = smallest element's index from index to input.count - 1
        // swap minIndex with index
        var input = input
        for currentIndex in 0 ..< input.count - 1 {
            var minIndex = currentIndex
            for i in minIndex + 1 ..< input.count {
                if input[i] < input[minIndex] {
                    minIndex = i
                }
            }
            input.swapAt(currentIndex, minIndex)
        }
        return input
    }
}
