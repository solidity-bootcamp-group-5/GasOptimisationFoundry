/// @use-src 23:"src/Gas.sol"
object "GasContractYul" {
    code {
        {
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            mstore(64, memoryguard(0x0100))
            let programSize := datasize("GasContractYul")
            let argSize := sub(codesize(), programSize)
            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)
            let _1 := add(memoryDataOffset, argSize)
            if slt(sub(_1, memoryDataOffset), 64)
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            let offset := mload(memoryDataOffset)
            if gt(offset, sub(shl(64, 1), 1))
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            let _2 := add(memoryDataOffset, offset)
            if iszero(slt(add(_2, 0x1f), _1))
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            let length := mload(_2)
            if gt(length, sub(shl(64, 1), 1))
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0x24)
            }
            let _3 := shl(5, length)
            let dst := allocate_memory(add(_3, 0x20))
            let array := dst
            mstore(dst, length)
            dst := add(dst, 0x20)
            let dst_1 := dst
            let srcEnd := add(add(_2, _3), 0x20)
            if gt(srcEnd, _1)
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            let src := add(_2, 0x20)
            for { } lt(src, srcEnd) { src := add(src, 0x20) }
            {
                let value := mload(src)
                if iszero(eq(value, and(value, sub(shl(160, 1), 1))))
                {
                    revert(/** @src -1:-1:-1 */ 0, 0)
                }
                /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                mstore(dst, value)
                dst := add(dst, 0x20)
            }
            /// @src 23:2034:2044  "_admins[0]"
            let addr := /** @src -1:-1:-1 */ 0
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            if iszero(mload(array))
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ shl(224, 0x4e487b71))
                mstore(4, 0x32)
                revert(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0x24)
            }
            addr := dst_1
            /// @src 23:2025:2044  "admin0 = _admins[0]"
            mstore(128, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ and(mload(dst_1), sub(shl(160, 1), 1)))
            /// @src 23:2063:2073  "_admins[1]"
            let addr_1 := /** @src -1:-1:-1 */ 0
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            if iszero(lt(/** @src 23:2071:2072  "1" */ 0x01, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ mload(array)))
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ shl(224, 0x4e487b71))
                mstore(4, 0x32)
                revert(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0x24)
            }
            addr_1 := add(array, 64)
            /// @src 23:2054:2073  "admin1 = _admins[1]"
            mstore(160, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ and(mload(addr_1), sub(shl(160, 1), 1)))
            /// @src 23:2092:2102  "_admins[2]"
            let addr_2 := /** @src -1:-1:-1 */ 0
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            if iszero(lt(/** @src 23:2100:2101  "2" */ 0x02, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ mload(array)))
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ shl(224, 0x4e487b71))
                mstore(4, 0x32)
                revert(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0x24)
            }
            addr_2 := add(array, 96)
            /// @src 23:2083:2102  "admin2 = _admins[2]"
            mstore(192, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ and(mload(addr_2), sub(shl(160, 1), 1)))
            /// @src 23:2121:2131  "_admins[3]"
            let addr_3 := /** @src -1:-1:-1 */ 0
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            if iszero(lt(/** @src 23:2129:2130  "3" */ 0x03, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ mload(array)))
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ shl(224, 0x4e487b71))
                mstore(4, 0x32)
                revert(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0x24)
            }
            addr_3 := add(array, /** @src 23:2025:2044  "admin0 = _admins[0]" */ 128)
            /// @src 23:2112:2131  "admin3 = _admins[3]"
            mstore(224, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ and(mload(addr_3), sub(shl(160, 1), 1)))
            let _4 := mload(64)
            let _5 := datasize("GasContractYul_deployed")
            codecopy(_4, dataoffset("GasContractYul_deployed"), _5)
            setimmutable(_4, "39177", mload(/** @src 23:2025:2044  "admin0 = _admins[0]" */ 128))
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            setimmutable(_4, "39179", mload(/** @src 23:2054:2073  "admin1 = _admins[1]" */ 160))
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            setimmutable(_4, "39181", mload(/** @src 23:2083:2102  "admin2 = _admins[2]" */ 192))
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            setimmutable(_4, "39183", mload(/** @src 23:2112:2131  "admin3 = _admins[3]" */ 224))
            /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
            return(_4, _5)
        }
        function allocate_memory(size) -> memPtr
        {
            memPtr := mload(64)
            let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
            if or(gt(newFreePtr, sub(shl(64, 1), 1)), lt(newFreePtr, memPtr))
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0x24)
            }
            mstore(64, newFreePtr)
        }
    }
    /// @use-src 23:"src/Gas.sol"
    object "GasContractYul_deployed" {
        code {
            {
                /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                let _1 := memoryguard(0x80)
                mstore(64, _1)
                if iszero(lt(calldatasize(), 4))
                {
                    switch shr(224, calldataload(0))
                    case 0x214405fc {
                        if slt(add(calldatasize(), not(3)), 64) { revert(0, 0) }
                        let value0 := abi_decode_address()
                        let value := calldataload(36)
                        /// @src 23:1896:1936  "if (!checkForAdmin(msg.sender)) revert()"
                        if /** @src 23:1900:1926  "!checkForAdmin(msg.sender)" */ iszero(/** @src 23:2508:2523  "admin4 == _user" */ eq(/** @src 23:1797:1803  "0x1234" */ 0x1234, /** @src 23:1915:1925  "msg.sender" */ caller()))
                        /// @src 23:1896:1936  "if (!checkForAdmin(msg.sender)) revert()"
                        {
                            /// @src 23:1928:1936  "revert()"
                            revert(/** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0, 0)
                        }
                        if iszero(/** @src 23:3754:3765  "_tier < 255" */ lt(value, /** @src 23:3762:3765  "255" */ 0xff))
                        /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                        { revert(0, 0) }
                        mstore(_1, and(value0, sub(shl(160, 1), 1)))
                        mstore(add(_1, 32), value)
                        /// @src 23:3870:3905  "AddedToWhitelist(_userAddrs, _tier)"
                        log1(_1, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 64, /** @src 23:3870:3905  "AddedToWhitelist(_userAddrs, _tier)" */ 0x62c1e066774519db9fe35767c15fc33df2f016675b7cc0c330ed185f286a2d52)
                        /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                        return(0, 0)
                    }
                    case 0x27e235e3 { external_fun_balances() }
                    case 0x56b8c724 {
                        if slt(add(calldatasize(), not(3)), 96) { revert(0, 0) }
                        let value0_1 := abi_decode_address()
                        let offset := calldataload(68)
                        if gt(offset, sub(shl(64, 1), 1)) { revert(0, 0) }
                        if iszero(slt(add(offset, 35), calldatasize())) { revert(0, 0) }
                        let length := calldataload(add(4, offset))
                        if gt(length, sub(shl(64, 1), 1)) { revert(0, 0) }
                        if gt(add(add(offset, length), 36), calldatasize()) { revert(0, 0) }
                        /// @src 23:3261:3268  "_amount"
                        fun_transferImpl(value0_1, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ calldataload(36))
                        return(0, 0)
                    }
                    case 0x70a08231 { external_fun_balances() }
                    case 0x888b2284 {
                        if callvalue() { revert(0, 0) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(0, 0) }
                        pop(abi_decode_address())
                        let _2 := sload(/** @src 23:4320:4324  "true" */ 0x01)
                        /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                        let memPos := mload(64)
                        mstore(memPos, /** @src 23:4320:4324  "true" */ 0x01)
                        /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                        mstore(add(memPos, 32), _2)
                        return(memPos, 64)
                    }
                    case 0x9b19251a {
                        if callvalue() { revert(0, 0) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(0, 0) }
                        pop(abi_decode_address())
                        let memPos_1 := mload(64)
                        mstore(memPos_1, 0)
                        return(memPos_1, 32)
                    }
                    case 0xb52d15e2 {
                        if callvalue() { revert(0, 0) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(0, 0) }
                        /// @src 23:2501:2523  "return admin4 == _user"
                        let var_admin := /** @src 23:2508:2523  "admin4 == _user" */ eq(/** @src 23:1797:1803  "0x1234" */ 0x1234, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ and(abi_decode_address(), sub(shl(160, 1), 1)))
                        let memPos_2 := mload(64)
                        mstore(memPos_2, var_admin)
                        return(memPos_2, 32)
                    }
                    case 0xd89d1510 {
                        if callvalue() { revert(0, 0) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(0, 0) }
                        let ret := fun_administrators(calldataload(4))
                        let memPos_3 := mload(64)
                        mstore(memPos_3, and(ret, sub(shl(160, 1), 1)))
                        return(memPos_3, 32)
                    }
                    case 0xea28d320 {
                        if slt(add(calldatasize(), not(3)), 64) { revert(0, 0) }
                        let value0_2 := abi_decode_address()
                        let value_1 := calldataload(36)
                        /// @src 23:4111:4140  "WhiteListTransfer(_recipient)"
                        log2(/** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0, 0, /** @src 23:4111:4140  "WhiteListTransfer(_recipient)" */ 0x98eaee7299e9cbfa56cf530fd3a0c6dfa0ccddf4f837b8f025651ad9594647b3, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ and(/** @src 23:4111:4140  "WhiteListTransfer(_recipient)" */ value0_2, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ sub(shl(160, 1), 1)))
                        sstore(1, value_1)
                        /// @src 23:4210:4217  "_amount"
                        fun_transferImpl(value0_2, value_1)
                        /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                        return(0, 0)
                    }
                }
                revert(0, 0)
            }
            function abi_decode_address() -> value
            {
                value := calldataload(4)
                if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(0, 0) }
            }
            function external_fun_balances()
            {
                if callvalue() { revert(0, 0) }
                if slt(add(calldatasize(), not(3)), 32)
                {
                    revert(/** @src -1:-1:-1 */ 0, 0)
                }
                /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                let value0 := abi_decode_address()
                /// @src 23:2787:2806  "balancesImpl(_user)"
                let var_balance := /** @src -1:-1:-1 */ 0
                /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                let _1 := and(value0, sub(shl(160, 1), 1))
                mstore(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ _1)
                mstore(32, /** @src -1:-1:-1 */ 0)
                /// @src 23:2906:2936  "balance_ = the_balances[_user]"
                var_balance := /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ sload(keccak256(/** @src -1:-1:-1 */ 0, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0x40))
                /// @src 23:2946:3029  "if (_user == admin4) {..."
                if /** @src 23:2950:2965  "_user == admin4" */ eq(/** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ _1, /** @src 23:1797:1803  "0x1234" */ 0x1234)
                /// @src 23:2946:3029  "if (_user == admin4) {..."
                {
                    /// @src 23:2993:3016  "balance_ += totalSupply"
                    var_balance := /** @src 23:1841:1851  "1000000000" */ add(/** @src 23:2993:3016  "balance_ += totalSupply" */ var_balance, /** @src 23:1841:1851  "1000000000" */ 0x3b9aca00)
                }
                /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                let memPos := mload(0x40)
                mstore(memPos, var_balance)
                return(memPos, 32)
            }
            /// @ast-id 39272 @src 23:2144:2413  "function administrators(uint256 _index) external view returns (address admin_) {..."
            function fun_administrators(var_index) -> var_admin
            {
                /// @src 23:2207:2221  "address admin_"
                var_admin := /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0
                /// @src 23:2233:2263  "if (_index == 0) return admin0"
                if /** @src 23:2237:2248  "_index == 0" */ iszero(var_index)
                /// @src 23:2233:2263  "if (_index == 0) return admin0"
                {
                    /// @src 23:2250:2263  "return admin0"
                    var_admin := /** @src 23:2257:2263  "admin0" */ loadimmutable("39177")
                    /// @src 23:2250:2263  "return admin0"
                    leave
                }
                /// @src 23:2273:2303  "if (_index == 1) return admin1"
                if /** @src 23:2277:2288  "_index == 1" */ eq(var_index, /** @src 23:2287:2288  "1" */ 0x01)
                /// @src 23:2273:2303  "if (_index == 1) return admin1"
                {
                    /// @src 23:2290:2303  "return admin1"
                    var_admin := /** @src 23:2297:2303  "admin1" */ loadimmutable("39179")
                    /// @src 23:2290:2303  "return admin1"
                    leave
                }
                /// @src 23:2313:2343  "if (_index == 2) return admin2"
                if /** @src 23:2317:2328  "_index == 2" */ eq(var_index, /** @src 23:2327:2328  "2" */ 0x02)
                /// @src 23:2313:2343  "if (_index == 2) return admin2"
                {
                    /// @src 23:2330:2343  "return admin2"
                    var_admin := /** @src 23:2337:2343  "admin2" */ loadimmutable("39181")
                    /// @src 23:2330:2343  "return admin2"
                    leave
                }
                /// @src 23:2353:2383  "if (_index == 3) return admin3"
                if /** @src 23:2357:2368  "_index == 3" */ eq(var_index, /** @src 23:2367:2368  "3" */ 0x03)
                /// @src 23:2353:2383  "if (_index == 3) return admin3"
                {
                    /// @src 23:2370:2383  "return admin3"
                    var_admin := /** @src 23:2377:2383  "admin3" */ loadimmutable("39183")
                    /// @src 23:2370:2383  "return admin3"
                    leave
                }
                /// @src 23:2393:2406  "return admin4"
                var_admin := /** @src 23:1797:1803  "0x1234" */ 0x1234
            }
            /// @ast-id 39378 @src 23:3282:3619  "function transferImpl(..."
            function fun_transferImpl(var_recipient, var_amount)
            {
                /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                mstore(/** @src 23:3516:3528  "the_balances" */ 0x00, /** @src 23:3529:3539  "msg.sender" */ caller())
                /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                mstore(0x20, /** @src 23:3516:3528  "the_balances" */ 0x00)
                /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                let dataSlot := keccak256(/** @src 23:3516:3528  "the_balances" */ 0x00, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0x40)
                sstore(dataSlot, sub(sload(/** @src 23:3516:3551  "the_balances[msg.sender] -= _amount" */ dataSlot), /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ var_amount))
                mstore(/** @src 23:3516:3528  "the_balances" */ 0x00, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ and(var_recipient, sub(shl(160, 1), 1)))
                mstore(0x20, /** @src 23:3516:3528  "the_balances" */ 0x00)
                /// @src 23:1514:4351  "contract GasContractImpl is GasContract {..."
                let dataSlot_1 := keccak256(/** @src 23:3516:3528  "the_balances" */ 0x00, /** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ 0x40)
                sstore(dataSlot_1, /** @src 23:1841:1851  "1000000000" */ add(/** @src 23:1514:4351  "contract GasContractImpl is GasContract {..." */ sload(/** @src 23:3575:3610  "the_balances[_recipient] += _amount" */ dataSlot_1), /** @src 23:1841:1851  "1000000000" */ var_amount))
            }
        }
        data ".metadata" hex""
    }
}
