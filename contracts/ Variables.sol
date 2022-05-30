//함수와 달리 상태 변수는 자식 계약에서 다시 선언하여 재정의할 수 없습니다.

// /상속된 상태 변수를 올바르게 재정의하는 방법을 알아보겠습니다
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

// Shadowing is disallowed in Solidity 0.6
// This will not compile
// contract B is A {
//     string public name = "Contract B";
// }

contract C is A {
    // This is the correct way to override inherited state variables.
    constructor() {
        name = "Contract C";
    }

    // C.getName returns "Contract C"
}