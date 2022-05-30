// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// import Foo.sol from current directory
import "./Point.sol";

// import {symbol1 as alias, symbol2} from "filename";
import {Unauthorized, add as func, Foo2} from "./Point.sol";

contract Import {
    // Initialize Foo.sol
    Foo2 public foo2 = new Foo2();

    // Test Foo.sol by getting it's name.
    function getFooName() public view returns (string memory) {
        return foo2.name();
    }
}