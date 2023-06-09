// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract DataTypes {
    // basic types: boolean,uint,int,address, bytes
    bool hasFavoriteNumber = true;
    uint favoriteNumber = 256;

    /*
    
    string and bytes both are same use to store text in bytes format
    string are used to store dynamic length of text ()
    where bytes used to store fixed length of text (gas efficeint)
    
    */
    string favoriteNumberInText = "256";
    bytes favouriteTextinBytes = "shiba";
    int favoriteInt = -256;
    address myAddress = 0xCd0bF3faD548e727E721fF26AE662b126a00D990;
}
