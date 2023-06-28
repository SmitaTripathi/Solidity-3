// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

//You can interact with other contracts by declaring an interface
//interface 
//** cannot have any function implemneted
//** can inherit from other interfaces
//** all declared functions must be external
//** cannot declare a contructor 
//** cannot declare state variables

contract counter{
    uint public count;

    function increment() external{
        count +=1;
    }
}

interface Icounter {
    function count() external view returns (uint) ;

    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        Icounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
    return Icounter(_counter).count();
    }
}

//Uniswap example
interface UniswapV2Factory {
    function getPair(address tokenA,address tokenB)
        external 
        view 
        returns (address pair);
}

interface UniswapV2Pair {
    function getReserves()
       external 
       view 
       returns (
           uint112 reserve0,
           uint112 reserve1,
           uint32 blockTimestampLast
       );
}

contract UniswapV2Example{
    address private factory = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address private dai = 0x617F2E2fD72FD9D5503197092aC168c91465E7f2;
    address private  weth = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    function getTokenReserves() external view returns (uint ,uint) {
        address pair = UniswapV2Factory(factory).getPair(dai,weth);
        (uint reserve0, uint reserve1,) = UniswapV2Pair(pair).getReserves();
        return (reserve0,reserve1);
    }
}