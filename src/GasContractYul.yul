
object "GasContractYul" {
	code {
		{
			// ctor args are (address[] A, uint256 B)
			// [64, B, A.length, A[0], A[1], A[2], A[3], ...]
			let _offset := dataoffset("GasContractYul_deployed")
			let _size := datasize("GasContractYul_deployed")
			let _args := add(_offset, _size)
			codecopy(0, _offset, _size)
			_args := add(_args, 108)
			codecopy(_size, _args, 20)
			_size := add(_size, 20)
			_args := add(_args, 32)
			codecopy(_size, _args, 20)
			_size := add(_size, 20)
			_args := add(_args, 32)
			codecopy(_size, _args, 20)
			_size := add(_size, 20)
			_args := add(_args, 32)
			codecopy(_size, _args, 20)
			_size := add(_size, 20)
			return(0, _size)
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
						let _index := calldataload(4)
						let _offset := add(datasize("GasContractYul_deployed"), mul(20, _index))
						codecopy(12, _offset, 20)
						mstore(32, 0x1234)
						let _return := shl(5, eq(_index, 4))
						return(_return, 32)
					}
					case 0xea28d320 {
						// whiteTransfer
						let _recipient := calldataload(4)
						let _amount := calldataload(36)
						log2(0, 0, 0x98eaee7299e9cbfa56cf530fd3a0c6dfa0ccddf4f837b8f025651ad9594647b3, _recipient)
						sstore(1, _amount)
						fun_transferImpl(_recipient, _amount)
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

			function fun_transferImpl(var_recipient, var_amount)
			{
				mstore(0x00, caller())
				let dataSlot := keccak256(0x00, 0x40)
				sstore(dataSlot, sub(sload(dataSlot), var_amount))
				mstore(0x00, var_recipient)
				let dataSlot_1 := keccak256(0x00, 0x40)
				sstore(dataSlot_1, add(sload(dataSlot_1), var_amount))
				return(0, 0)
			}
		}
	}
}
