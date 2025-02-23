
object "GasContractYul" {
	code {
		{

			mstore(64, memoryguard(0x0100))
			let programSize := datasize("GasContractYul")
			let argSize := sub(codesize(), programSize)
			let memoryDataOffset := allocate_memory(argSize)
			codecopy(memoryDataOffset, programSize, argSize)
			let _1 := add(memoryDataOffset, argSize)
			if slt(sub(_1, memoryDataOffset), 64)
			{
				revert(0, 0)
			}

			let offset := mload(memoryDataOffset)
			if gt(offset, sub(shl(64, 1), 1))
			{
				revert(0, 0)
			}

			let _2 := add(memoryDataOffset, offset)
			if iszero(slt(add(_2, 0x1f), _1))
			{
				revert(0, 0)
			}

			let length := mload(_2)
			if gt(length, sub(shl(64, 1), 1))
			{
				mstore(0, shl(224, 0x4e487b71))
				mstore(4, 0x41)
				revert(0, 0x24)
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
				revert(0, 0)
			}

			let src := add(_2, 0x20)
			for { } lt(src, srcEnd) { src := add(src, 0x20) }
			{
				let value := mload(src)
				if iszero(eq(value, and(value, sub(shl(160, 1), 1))))
				{
					revert(0, 0)
				}

				mstore(dst, value)
				dst := add(dst, 0x20)
			}

			let addr := 0

			if iszero(mload(array))
			{
				mstore(0, shl(224, 0x4e487b71))
				mstore(4, 0x32)
				revert(0, 0x24)
			}
			addr := dst_1

			mstore(128, and(mload(dst_1), sub(shl(160, 1), 1)))

			let addr_1 := 0

			if iszero(lt(0x01, mload(array)))
			{
				mstore(0, shl(224, 0x4e487b71))
				mstore(4, 0x32)
				revert(0, 0x24)
			}
			addr_1 := add(array, 64)

			mstore(160, and(mload(addr_1), sub(shl(160, 1), 1)))

			let addr_2 := 0

			if iszero(lt(0x02, mload(array)))
			{
				mstore(0, shl(224, 0x4e487b71))
				mstore(4, 0x32)
				revert(0, 0x24)
			}
			addr_2 := add(array, 96)

			mstore(192, and(mload(addr_2), sub(shl(160, 1), 1)))

			let addr_3 := 0

			if iszero(lt(0x03, mload(array)))
			{
				mstore(0, shl(224, 0x4e487b71))
				mstore(4, 0x32)
				revert(0, 0x24)
			}
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

				let _1 := memoryguard(0x80)
				mstore(64, _1)
				if iszero(lt(calldatasize(), 4))
				{
					switch shr(224, calldataload(0))
					case 0x214405fc {
						if slt(add(calldatasize(), not(3)), 64) { revert(0, 0) }
						let value0 := abi_decode_address()
						let value := calldataload(36)

						if iszero(eq(0x1234, caller()))

						{

							revert(0, 0)
						}
						if iszero(lt(value, 0xff))

						{ revert(0, 0) }
						mstore(_1, and(value0, sub(shl(160, 1), 1)))
						mstore(add(_1, 32), value)

						log1(_1, 64, 0x62c1e066774519db9fe35767c15fc33df2f016675b7cc0c330ed185f286a2d52)

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

						fun_transferImpl(value0_1, calldataload(36))
						return(0, 0)
					}
					case 0x70a08231 { external_fun_balances() }
					case 0x888b2284 {
						if callvalue() { revert(0, 0) }
						if slt(add(calldatasize(), not(3)), 32) { revert(0, 0) }
						pop(abi_decode_address())
						let _2 := sload(0x01)

						let memPos := mload(64)
						mstore(memPos, 0x01)

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

						let var_admin := eq(0x1234, and(abi_decode_address(), sub(shl(160, 1), 1)))
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

						log2(0, 0, 0x98eaee7299e9cbfa56cf530fd3a0c6dfa0ccddf4f837b8f025651ad9594647b3, and(value0_2, sub(shl(160, 1), 1)))
						sstore(1, value_1)

						fun_transferImpl(value0_2, value_1)

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
					revert(0, 0)
				}

				let value0 := abi_decode_address()

				let var_balance := 0

				let _1 := and(value0, sub(shl(160, 1), 1))
				mstore(0, _1)
				mstore(32, 0)

				var_balance := sload(keccak256(0, 0x40))

				if eq(_1, 0x1234)

				{

					var_balance := add(var_balance, 0x3b9aca00)
				}

				let memPos := mload(0x40)
				mstore(memPos, var_balance)
				return(memPos, 32)
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

				mstore(0x20, 0x00)

				let dataSlot := keccak256(0x00, 0x40)
				sstore(dataSlot, sub(sload(dataSlot), var_amount))
				mstore(0x00, and(var_recipient, sub(shl(160, 1), 1)))
				mstore(0x20, 0x00)

				let dataSlot_1 := keccak256(0x00, 0x40)
				sstore(dataSlot_1, add(sload(dataSlot_1), var_amount))
			}
		}
		data ".metadata" hex""
	}
}
