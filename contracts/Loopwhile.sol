// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//Solidity는 for, while및 do while루프를 지원합니다.

//제한 없는 루프를 작성하지 마십시오. 가스 한도에 도달하여 트랜잭션이 실패할 수 있습니다.

//위와 같은 이유로 루프는 거의 사용되지 않습니다 while.do while
contract Loop {
    function loop() public {
        // for loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint j;
        while (j < 10) {
            j++;
        }
    }
}