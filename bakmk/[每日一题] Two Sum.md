#	[每日一题]  Two Sum




>	Given an array of integers, return indices of the two numbers such that they add up to a specific target.
>You may assume that each input would have exactly one solution, and you may not use the same element twice.
>给定一个整数数组，返回两个数字的索引，使它们相加到特定目标。
>您可以假设每次输入都是唯一的值。
```
Given nums = [2, 7, 11, 15], target = 9,
Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
```

## 第一种最笨的方法

``` c++
	vector<int> twoSum(vector<int>& nums,int target) {
		vector<int> result;
		int i,j =0;
		int len = nums.size();
		for(;i <len; ++i) {
			for(j = i+1; j < len; ++j) {
				if(nums[i] + nums[j] == target) {
					result.push_back(i);
					result.push_back(j);
				}
			}
		}
		return result;
	}
```
这里的时间复杂度是:**O(n²)**
其实这个题期望的复杂度是:**O(n)**

##	最优解的方法 采用hash表来做索引
``` c++
	vector<int> twoSum_HashMap(vector<int>& nums,int target) {
        vector<int> result;
        unordered_map<int,int> temp;
        int i =0; int len = nums.size();
        for(;i < len; ++i) {
            if(temp.find(target-nums[i]) != temp.end()) {
                result.push_back(temp[target - nums[i]]);
                result.push_back(i);
            }
            temp[nums[i]] = i;
        }
        return result;
    }
```



##	剖析
*	这里使用unordered_map 是因为内部数据结构是哈希表
*	哈希表的特点就是查找效率高,时间复杂度为常数级**O(1)**
