// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICrossChainRouter {
    function sendMessage(
        uint256 chainId,
        address receiver,
        bytes calldata data
    ) external payable;
}

contract PolygonSUM {
    uint256 result;

    function MakeSum(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    ICrossChainRouter public Router;

    constructor(address _router) {
        Router = ICrossChainRouter(_router);
    }

    function recieveMessage(bytes calldata data) public {
        (uint256 a, uint256 b, address sender) = abi.decode(
            data,
            (uint256, uint256, address)
        );
        result = MakeSum(a, b);
        bytes memory paylod = abi.encode(result);
        Router.sendMessage(11155111, sender, paylod);
    }
}

contract SendValue {
    uint result;
    ICrossChainRouter public Router;

    constructor(address _router) {
        Router = ICrossChainRouter(_router);
    }

    function SendValueToPolygon(
        uint256 a,
        uint256 b,
        address polygonAddres
    ) public {
        bytes memory payload = abi.encode(a, b, address(this));
        Router.sendMessage(137, polygonAddres, payload);
    }

    function recieveMessage(bytes calldata data) public {
        uint res = abi.decode(data, (uint));
        result = res;
    }
}
