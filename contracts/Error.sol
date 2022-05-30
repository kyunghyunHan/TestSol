// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//require실행 전에 입력 및 조건을 확인하는 데 사용됩니다.
//revert와 비슷합니다 require. 자세한 내용은 아래 코드를 참조하세요.
//assert절대 거짓이 되어서는 안 되는 코드를 확인하는 데 사용됩니다. 어설션 실패는 아마도 버그가 있음을 의미합니다.
contract Error{
    function testRequire(uint _i)public pure {
        require(_i>10,"Input must be greater than 10");
    }

    function testRevert(uint _i )public pure {

        if(_i <=10){
            revert("Input must be greter than 10");
        }
    }
    uint public num;

    function testAssert ()public view{

        assert(num ==0);
    }

    error InsufficienBalance(uint balance,uint withdrawAmount);

    function testCustomError(uint _withdrawAmount)public view{
        uint bal = address(this).balance;
        if(bal <_withdrawAmount){
            revert InsufficienBalance({balance:bal,withdrawAmount:_withdrawAmount});
        }
    }

    
}
