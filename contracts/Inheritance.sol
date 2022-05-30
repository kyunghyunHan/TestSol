//Solidity는 다중 상속을 지원합니다. is계약은 키워드 를 사용하여 다른 계약을 상속할 수 있습니다 .

//자식 계약에 의해 재정의될 함수는 로 선언해야 합니다 virtual.

//상위 함수를 재정의할 함수는 키워드를 사용해야 합니다 override.

//상속 순서가 중요합니다.

//상위 계약을 "가장 기본 유사"에서 "가장 파생" 순으로 나열해야 합니다.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}
contract B is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}
contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}
contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}
contract E is C, B {
    // E.foo() returns "B"
    // since B is the right most parent contract with function foo()
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}
// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}