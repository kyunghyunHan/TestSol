//다중 서명 지갑을 만들어 봅시다. 사양은 다음과 같습니다.

//지갑 소유자는

//거래를 제출하다
//보류 중인 거래 승인 및 취소
//충분한 소유자가 승인한 후 누구나 거래를 실행할 수 있습니다.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract MultiSigWallet {
 event Deposit(address indexed sender, uint amount, uint balance);
event SubmitTransaction(
        address indexed owner,
        uint indexed txIndex,
        address indexed to,
        uint value,
        bytes data
    );
      event ConfirmTransaction(address indexed owner, uint indexed txIndex);
    event RevokeConfirmation(address indexed owner, uint indexed txIndex);
    event ExecuteTransaction(address indexed owner, uint indexed txIndex);

   address[] public owners;
      mapping(address => bool) public isOwner;
    uint public numConfirmationsRequired;


}