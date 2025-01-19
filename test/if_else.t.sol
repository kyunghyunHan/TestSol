// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IfElse} from "../src/if_else.sol";

contract CounterTest is Test {
    IfElse public if_self;

    function setUp() public {
        if_self = new IfElse();
    }

    function test_Increment() view public {
      
        assertEq(if_self.ternary(3), 1);
    }

   
}
