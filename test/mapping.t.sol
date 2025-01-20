// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Mapping} from "../src/mapping.sol";

contract MappingTest is Test {
    Mapping public mappingTest;

    function setUp() public {
        mappingTest = new Mapping();
    }

    function test_SetAndGet() public {
        address testAddress = address(1);
        uint256 value = 42;

        // 값 설정
        mappingTest.set(testAddress, value);

        // 값 확인
        uint256 storedValue = mappingTest.get(testAddress);
        assertEq(storedValue, value);
    }

    function test_Remove() public {
        address testAddress = address(2);
        uint256 value = 100;

        // 값 설정
        mappingTest.set(testAddress, value);

        // 값 삭제
        mappingTest.remove(testAddress);

        // 삭제된 값이 0인지 확인
        uint256 storedValue = mappingTest.get(testAddress);
        assertEq(storedValue, 0);
    }
}
