// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract UniswapV2SwapExamples {
    // 메인넷 Uniswap V2 Router 주소
    address private constant UNISWAP_V2_ROUTER =
        0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    // WETH, DAI, USDC 메인넷 주소
    address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    // Uniswap Router, WETH, DAI 인터페이스 인스턴스 생성
    IUniswapV2Router private router = IUniswapV2Router(UNISWAP_V2_ROUTER);
    IERC20 private weth = IERC20(WETH);
    IERC20 private dai = IERC20(DAI);

    // ==========================
    // 1. WETH → DAI 단일 경로 스왑 (Exact Amount In)
    // ==========================
    function swapSingleHopExactAmountIn(uint256 amountIn, uint256 amountOutMin)
        external
        returns (uint256 amountOut)
    {
        // 1) 사용자로부터 WETH 받기
        weth.transferFrom(msg.sender, address(this), amountIn);
        // 2) Router에 WETH 사용 허가
        weth.approve(address(router), amountIn);

        // 3) 스왑 경로 설정: WETH → DAI
        address[] memory path;
        path = new address ;
        path[0] = WETH;
        path[1] = DAI;

        // 4) 스왑 실행
        uint256[] memory amounts = router.swapExactTokensForTokens(
            amountIn,        // 내가 보내는 토큰 양
            amountOutMin,    // 최소 받을 토큰 양
            path,            // 스왑 경로
            msg.sender,      // 토큰 받을 주소
            block.timestamp  // 거래 마감 시간
        );

        // amounts[1] = 실제 받은 DAI 양
        return amounts[1];
    }

    // ==========================
    // 2. DAI → WETH → USDC 다중 경로 스왑 (Exact Amount In)
    // ==========================
    function swapMultiHopExactAmountIn(uint256 amountIn, uint256 amountOutMin)
        external
        returns (uint256 amountOut)
    {
        // 1) 사용자로부터 DAI 받기
        dai.transferFrom(msg.sender, address(this), amountIn);
        // 2) Router에 DAI 사용 허가
        dai.approve(address(router), amountIn);

        // 3) 스왑 경로 설정: DAI → WETH → USDC
        address[] memory path;
        path = new address ;
        path[0] = DAI;
        path[1] = WETH;
        path[2] = USDC;

        // 4) 스왑 실행
        uint256[] memory amounts = router.swapExactTokensForTokens(
            amountIn, amountOutMin, path, msg.sender, block.timestamp
        );

        // amounts[2] = 실제 받은 USDC 양
        return amounts[2];
    }

    // ==========================
    // 3. WETH → DAI 단일 경로 스왑 (Exact Amount Out)
    // ==========================
    function swapSingleHopExactAmountOut(
        uint256 amountOutDesired, // 내가 받고 싶은 DAI 양
        uint256 amountInMax       // 최대 사용할 WETH 양
    ) external returns (uint256 amountOut) {
        // 1) 사용자로부터 WETH 받기
        weth.transferFrom(msg.sender, address(this), amountInMax);
        // 2) Router에 WETH 사용 허가
        weth.approve(address(router), amountInMax);

        // 3) 스왑 경로 설정: WETH → DAI
        address[] memory path;
        path = new address ;
        path[0] = WETH;
        path[1] = DAI;

        // 4) 스왑 실행 (Exact Output)
        uint256[] memory amounts = router.swapTokensForExactTokens(
            amountOutDesired, amountInMax, path, msg.sender, block.timestamp
        );

        // 5) 사용 안 한 WETH 환불
        if (amounts[0] < amountInMax) {
            weth.transfer(msg.sender, amountInMax - amounts[0]);
        }

        return amounts[1];
    }

    // ==========================
    // 4. DAI → WETH → USDC 다중 경로 스왑 (Exact Amount Out)
    // ==========================
    function swapMultiHopExactAmountOut(
        uint256 amountOutDesired, // 받고 싶은 USDC 양
        uint256 amountInMax       // 최대 사용할 DAI 양
    ) external returns (uint256 amountOut) {
        // 1) 사용자로부터 DAI 받기
        dai.transferFrom(msg.sender, address(this), amountInMax);
        // 2) Router에 DAI 사용 허가
        dai.approve(address(router), amountInMax);

        // 3) 스왑 경로 설정: DAI → WETH → USDC
        address[] memory path;
        path = new address ;
        path[0] = DAI;
        path[1] = WETH;
        path[2] = USDC;

        // 4) 스왑 실행 (Exact Output)
        uint256[] memory amounts = router.swapTokensForExactTokens(
            amountOutDesired, amountInMax, path, msg.sender, block.timestamp
        );

        // 5) 사용 안 한 DAI 환불
        if (amounts[0] < amountInMax) {
            dai.transfer(msg.sender, amountInMax - amounts[0]);
        }

        return amounts[2];
    }
}

// ==========================
// 인터페이스 정의
// ==========================

// Uniswap V2 Router 인터페이스
interface IUniswapV2Router {
    function swapExactTokensForTokens(
        uint256 amountIn,        // 입력 토큰 양
        uint256 amountOutMin,    // 최소 출력 토큰 양
        address[] calldata path, // 스왑 경로
        address to,              // 토큰 받을 주소
        uint256 deadline         // 마감 시간
    ) external returns (uint256[] memory amounts);

    function swapTokensForExactTokens(
        uint256 amountOut,       // 원하는 출력 토큰 양
        uint256 amountInMax,     // 최대 입력 토큰 양
        address[] calldata path, // 스왑 경로
        address to,              // 토큰 받을 주소
        uint256 deadline         // 마감 시간
    ) external returns (uint256[] memory amounts);
}

// ERC20 표준 인터페이스
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount)
        external
        returns (bool);
}

// WETH 전용 인터페이스 (ETH <-> WETH 변환)
interface IWETH is IERC20 {
    function deposit() external payable; // ETH → WETH
    function withdraw(uint256 amount) external; // WETH → ETH
}
