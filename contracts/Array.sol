
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract Array{
    uint[] public arr;
    uint[] public arr2 = [1,2,3];

    uint[10] public myFixedSizeArr;

    function get(uint i ) public view returns (uint){
        return arr[i];  
    }
}