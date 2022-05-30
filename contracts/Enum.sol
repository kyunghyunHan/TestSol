// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
 //상태추적
contract Enum {
    enum Status {
        Pending,   
        Shipped,
        Accepted,
        Rejected,
        Canceled
        
    }

    Status public status;
     function get() public view returns (Status) {
        return status;
    }
        function set(Status _status) public {
        status = _status;
    }
        function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}