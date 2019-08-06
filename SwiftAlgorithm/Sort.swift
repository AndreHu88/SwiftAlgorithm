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
    func bubbleSort(sortArray : [Int]) -> [Int] {
        
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
    func SelectionSort(sortArray : [Int]) -> [Int] {
        
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
}
