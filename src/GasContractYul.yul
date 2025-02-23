
object "GasContractYul" {
	code {
		{
			mstore(64, memoryguard(0x0100))
			let programSize := datasize("GasContractYul")
			let argSize := sub(codesize(), programSize)
			let memoryDataOffset := allocate_memory(argSize)
			codecopy(memoryDataOffset, programSize, argSize)

			let offset := mload(memoryDataOffset)

			let _2 := add(memoryDataOffset, offset)

			let length := mload(_2)
			let _3 := shl(5, length)
			let dst := allocate_memory(add(_3, 0x20))
			let array := dst
			mstore(dst, length)
			dst := add(dst, 0x20)
			let dst_1 := dst
			let srcEnd := add(add(_2, _3), 0x20)

			let src := add(_2, 0x20)
			for { } lt(src, srcEnd) { src := add(src, 0x20) }
			{
				let value := mload(src)
				mstore(dst, value)
				dst := add(dst, 0x20)
			}

			let addr := 0
			addr := dst_1
			mstore(128, and(mload(dst_1), sub(shl(160, 1), 1)))

			let addr_1 := 0
			addr_1 := add(array, 64)
			mstore(160, and(mload(addr_1), sub(shl(160, 1), 1)))

			let addr_2 := 0
			addr_2 := add(array, 96)
			mstore(192, and(mload(addr_2), sub(shl(160, 1), 1)))

			let addr_3 := 0
			addr_3 := add(array, 128)
			mstore(224, and(mload(addr_3), sub(shl(160, 1), 1)))
			let _4 := mload(64)
			let _5 := datasize("GasContractYul_deployed")
			codecopy(_4, dataoffset("GasContractYul_deployed"), _5)
			setimmutable(_4, "39177", mload(128))
			setimmutable(_4, "39179", mload(160))
			setimmutable(_4, "39181", mload(192))
			setimmutable(_4, "39183", mload(224))

			return(_4, _5)
		}
		function allocate_memory(size) -> memPtr
		{
			memPtr := mload(64)
			let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
			if or(gt(newFreePtr, sub(shl(64, 1), 1)), lt(newFreePtr, memPtr))
			{
				mstore(0, shl(224, 0x4e487b71))
				mstore(4, 0x41)
				revert(0, 0x24)
			}
			mstore(64, newFreePtr)
		}
	}

	object "GasContractYul_deployed" {
		code {
			{
				if iszero(lt(calldatasize(), 4))
				{
					switch shr(224, calldataload(0))
					case 0x214405fc {
						// addToWhitelist
						let _tier := calldataload(36)

						if iszero(
							and(
								eq(0x1234, caller()),
								lt(_tier, 255)
							)
						) { revert(0, 0) }

						mstore(0, calldataload(4))
						mstore(32, _tier)
						log1(0, 64, 0x62c1e066774519db9fe35767c15fc33df2f016675b7cc0c330ed185f286a2d52)

						return(0, 0)
					}
					case 0x27e235e3 { external_fun_balances() }
					case 0x56b8c724 {
						// transfer
						fun_transferImpl(calldataload(4), calldataload(36))
						return(0, 0)
					}
					case 0x70a08231 { external_fun_balances() }
					case 0x888b2284 {
						// getPaymentStatus
						mstore(0, 0x01)
						mstore(32, sload(0x01))
						return(0, 64)
					}
					case 0x9b19251a {
						// whitelist
						return(0, 32)
					}
					case 0xb52d15e2 {
						// checkForAdmin
						mstore(0, eq(0x1234, calldataload(4)))
						return(0, 32)
					}
					case 0xd89d1510 {
						// adminstrators
						mstore(0, fun_administrators(calldataload(4)))
						return(0, 32)
					}
					case 0xea28d320 {
						// whiteTransfer
						let _recipient := calldataload(4)
						let _amount := calldataload(36)
						log2(0, 0, 0x98eaee7299e9cbfa56cf530fd3a0c6dfa0ccddf4f837b8f025651ad9594647b3, _recipient)
						sstore(1, _amount)
						fun_transferImpl(_recipient, _amount)
						return(0, 0)
					}
				}
				revert(0, 0)
			}

			function external_fun_balances()
			{
				let _user := calldataload(4)
				mstore(0, _user)
				let var_balance := sload(keccak256(0, 0x40))
				var_balance := add(var_balance, mul(eq(_user, 0x1234), 0x3b9aca00))
				mstore(0, var_balance)
				return(0, 32)
			}

			function fun_administrators(var_index) -> var_admin
			{
				var_admin := 0
				if iszero(var_index)
				{
					var_admin := loadimmutable("39177")
					leave
				}
				if eq(var_index, 0x01)
				{
					var_admin := loadimmutable("39179")
					leave
				}
				if eq(var_index, 0x02)
				{
					var_admin := loadimmutable("39181")
					leave
				}
				if eq(var_index, 0x03)
				{
					var_admin := loadimmutable("39183")
					leave
				}
				var_admin := 0x1234
			}

			function fun_transferImpl(var_recipient, var_amount)
			{
				mstore(0x00, caller())
				let dataSlot := keccak256(0x00, 0x40)
				sstore(dataSlot, sub(sload(dataSlot), var_amount))
				mstore(0x00, var_recipient)
				let dataSlot_1 := keccak256(0x00, 0x40)
				sstore(dataSlot_1, add(sload(dataSlot_1), var_amount))
			}
		}
	}
}
