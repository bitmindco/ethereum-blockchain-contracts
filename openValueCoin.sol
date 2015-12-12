/*

- OpenValueCoin v1.0 -

This cryptocurrency creates a public tradeable fungible token
in the Ethereum Blockchain which may be used in an Open Value Network
(see http://ovn.space for a definition of OVN) to formalize flows of value
in a trustable way.

Initially, this token is fungible in order to be conceived as an internal
currency in one OVN, which can be exchanged by services within an existing
network or as a reputation mechanism. It may also serve as a "value-parser"
for investors who want to invest external capital in fiat currencies in 
an OVN.

It may be adquired by providing work value (being payed by the network) but
also in a crypto-currencies exchange or an investment web platform.

As other cryptoassets, the fixed market cap created in this contract
will be initially owned by the contract creator. According to this, 
it is important to deploy it from an Ethereum account democratically owned
by the OVN in which it is gonna be used. To do this, the creation of the 
currency should take place transparently and providing a Custodian Agreement 
(see http://ovn.space/?p=70) to guarantee the decentralization of the 
issuing power and the initial distribution of value within the community.

This first version is based on the Standarized Contract APIs of Ethereum
(https://github.com/ethereum/wiki/wiki/Standardized_Contract_APIs) but may
be extended and improved for other purposes, depending of the kind of value
which is gonna be measured in the currency, or to serve as a seed for several
currencies related with the different flows of value within an OVN, which
may be parsed or exchanged by other sorts of value (or crypto-currencies) 
according to specific value equations defined by the corresponding community.
 
This contract is intended for educational purposes, you are fully responsible 
for compliance with present or future regulations of finance, communications
and the universal rights of digital beings.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

**********************************************
More info: xmunch (at) xmunch.com
Diego González - http://www.xmunch.com
Bitcoin: 1JLg3M9H2xS4qbZEkRkvY8eeSDAVW1kho8
Litecoin: LPRt76XYmvGK3i73z9dBYHBBnhTS656UTs
Faircoin: fJU1XrPwymcwf6DuLrCBBAvsp9Bqg36znd
PGP Public Key: xmunch.com/pgp
**********************************************

*/

contract OpenValueCoin { 
    
	string public name;
    string public network;
    string public version;
    string public symbol;
    uint8 public decimals;
    
    mapping (address => uint256) public balanceOf;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
	event Savings(address indexed account, uint256 value);
    
    function OpenValueCoin(string _networkName) {
    
     	network = _networkName;
		version = "1.0";  
       	name = "OpenValueCoin";     
       	symbol = "Ø";
       	
       	/*By default the supply per network/version
	    will be 100 Million Ø */
       	uint256 supply = 100000000;
	
	    /* We will have two decimals*/
	    decimals = 2;
		
		/* The OVN account (owned by the custodian or
		controlled democratically by specific software)
		will own the initial supply */
		balanceOf[msg.sender] = supply;
        
    }

    function transfer(address _to, uint256 _value) {
        
		if (balanceOf[msg.sender] < _value) throw;
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;
        
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        Transfer(msg.sender, _to, _value);
    }
	
    function getSavings(address _account) {
        
		if (balanceOf[_account] == 0) throw;
        
        Savings(_account, balanceOf[_account]);
    }
	
    function getMySavings() {
        
		if (balanceOf[msg.sender] == 0) throw;
        
        Savings(msg.sender, balanceOf[msg.sender]);
    }	
	
}            
