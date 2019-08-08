//
//  Sort.swift
//  SwiftAlgorithm
//
//  Created by Jack on 2019/8/6.
//  Copyright © 2019 Dun. All rights reserved.
//

import Foundation

class SortAlgorithm: NSObject {
    
    /**
        冒泡排序法
        时间平均复杂度：O(n^2)  最坏复杂度:O(n^2)     最好复杂度: O(n)    空间复杂度: O(1) 稳定
     
        1. 比较相邻的元素， 如果第一个比第二个大，交换
        2. 对每一对相邻的元素做同样的比较，从开始的第一对到结尾的最后一对
        3. 重复以上步骤
     */
    static func bubbleSort<T : Comparable>(sortArray : [T]) -> [T] {
        
        var tempSortArray = sortArray
        let sortArrayCount = sortArray.count
        for i in 0 ..< sortArrayCount {
            
            for j in 0 ..< sortArrayCount - i - 1 {
                
                if tempSortArray[j] > tempSortArray[i] {
                    
                    let tempValue = tempSortArray[j]
                    tempSortArray[j] = tempSortArray[j + 1]
                    tempSortArray[j + 1] = tempValue
                }
            }
        }
        
        return tempSortArray
    }
    
    /**
        选择排序法
        1. 先在未排序序列找到最大元素，存放到排序序列的起始位置，无序区R[1,i-1]  有序区
        2. 遍历数组，选出数组中最大的元素
     
        [3,1,5,0,9]
     */
    static func selectionSort<T : Comparable>(sortArray : [T]) -> [T]{
        
        var tempSortArray = sortArray
        let sortArrayCount = sortArray.count
        for i in 0 ..< sortArrayCount {
            
            var minIndex = i
            for j in minIndex + 1 ..< sortArrayCount {
                
                if tempSortArray[minIndex] > tempSortArray[j] {
                    minIndex = j
                }
                let tempValue = tempSortArray[i]
                tempSortArray[i] = tempSortArray[minIndex]
                tempSortArray[minIndex] = tempValue
            }
        }
        return tempSortArray
    }
    
    /**
        插入排序法
        [3,1,5,0,9]
     时间平均复杂度：O(n^2)     最坏复杂度:O(n^2)   最好复杂度: O(n)       空间复杂度: O(1) 稳定
     1. 从第一个元素开始，该元素可以认为已经被排序
     2. 取出下一个元素，在已经排序的元素序列中从后向前扫描
     3. 如果该元素（已排序）大于新元素，将该元素移到下一位置
     4. 重复步骤 3，直到找到已排序的元素小于或者等于新元素的位置
     5. 将新元素插入到该位置后
     6. 重复步骤 2~5
     */
    static func insertionSort<T : Comparable>(sortArray : [T]) -> [T]{
        
        var tempSortArray = sortArray
        let sortArrayCount = sortArray.count
        for i in 1 ..< sortArrayCount {
            
            let tempValue = tempSortArray[i]
            var insertIndex = 0
            for j in 0 ..< i {
                insertIndex = i - 1 - j
                if tempValue > tempSortArray[insertIndex] {
                    insertIndex = i - j
                    break
                }
                tempSortArray[insertIndex + 1] = tempSortArray[insertIndex]
            }
            tempSortArray[insertIndex] = tempValue
            print("\(tempSortArray)")
        }
        return tempSortArray
    }
    
    /**
        快速排序法
        [3,1,5,0,9]
        快速排序的排序效率在几种排序算法中最高， 快排的思想 分治法
     
        基本思想是：
         1．先从数列中取出一个数作为基准数。
         2．分区过程，将比这个数大的数全放到它的右边，小于或等于它的数全放到它的左边。
         3．再对左右区间重复第二步，直到各区间只有一个数。
     */
    static func quickSort<T : Comparable>(sortArray : [T]) -> [T]{
        
        if sortArray.count <= 1 {
            return sortArray
        }
        print(sortArray)
        var tempSortArray = sortArray
        quickSortInternalMethod(sortArray: &tempSortArray, leftIndex: 0, rightIndex: tempSortArray.count - 1)
        return tempSortArray
    }
    
    static func quickSortInternalMethod<T : Comparable>(sortArray : inout [T], leftIndex : Int, rightIndex : Int) -> Void {
        
        var left = leftIndex, right = rightIndex, baselineIndex = 0
        if left < right {
            
            baselineIndex = partition(array: &sortArray, leftIndex: leftIndex, rightIndex: rightIndex)
            quickSortInternalMethod(sortArray: &sortArray, leftIndex: leftIndex, rightIndex: baselineIndex - 1)
            quickSortInternalMethod(sortArray: &sortArray, leftIndex: baselineIndex + 1, rightIndex: rightIndex)
        }
    }
    
   private static func partition<T : Comparable>(array : inout [T], leftIndex : Int, rightIndex : Int) -> Int {
        
        let pivot = leftIndex
        var index = pivot + 1
        var i = index
        while i <= rightIndex {
            
            if array[i] < array[pivot] {
                swap(array: &array, leftIndex: i, rightIndex: index)
                index += 1
            }
            i += 1
        }
        swap(array: &array, leftIndex: pivot, rightIndex: index - 1)
        print(array)
        return index - 1
    }
    
    private static func swap<T : Comparable>(array : inout [T], leftIndex : Int, rightIndex : Int) {
        
        let temp = array[leftIndex]
        array[leftIndex] = array[rightIndex]
        array[rightIndex] = temp
    }
    
}
