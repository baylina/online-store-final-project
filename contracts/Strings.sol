pragma solidity ^0.4.24;

/**
 * @dev Strings Library
 *
 * This is a 'one function' simple library used only to convert
 * strings to uppercase.
 *
 * It is used basically to demonstrate how to import and
 * use Libraries in this Final Project
 *
 */

library Strings {

    /**
     * _toUpper
     *
     * Convert an string to upper case and return the original
     * value when not alphabetic
     *
     * @param str The string to be converted to upper case
     * @return string The converted string
     */

    function _toUpper(string str) internal pure returns (string) {
  		bytes memory bStr = bytes(str);
  		bytes memory bLower = new bytes(bStr.length);
  		for (uint i = 0; i < bStr.length; i++) {
  			// Uppercase character...
  			if ((bStr[i] >= 97) && (bStr[i] <= 122)) {
  				// So we subtract 32 to make it uppercase
  				bLower[i] = bytes1(int(bStr[i]) - 32);
  			} else {
  				bLower[i] = bStr[i];
  			}
  		}
  		return string(bLower);
  	}

}
