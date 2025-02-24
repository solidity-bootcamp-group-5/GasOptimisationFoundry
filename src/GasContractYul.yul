
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
				let _arg0 := calldataload(4)
				let _arg1 := calldataload(36)
				switch byte(0, calldataload(0))
				case 0x21 {
					// addToWhitelist
					let _tier := _arg1

					if or(
						sub(0x1234, caller()),
						gt(_tier, 254)
					) { revert(0, 0) }

					mstore(0, _arg0)
					mstore(32, _tier)
					log1(0, 64, 0x62c1e066774519db9fe35767c15fc33df2f016675b7cc0c330ed185f286a2d52)

					stop()
				}
				case 0x27 { external_fun_balances(_arg0) }
				case 0x56 {
					// transfer
					fun_transferImpl(_arg0, _arg1)
				}
				case 0x70 { external_fun_balances(_arg0) }
				case 0x88 {
					// getPaymentStatus
					mstore(0, 0x01)
					mstore(32, sload(0x01))
					return(0, 64)
				}
				case 0x9b {
					// whitelist
					return(0, 32)
				}
				case 0xb5 {
					// checkForAdmin
					mstore(0, eq(0x1234, _arg0))
					return(0, 32)
				}
				case 0xd8 {
					// adminstrators
					let _index := _arg0
					let _offset := add(datasize("GasContractYul_deployed"), mul(20, _index))
					codecopy(12, _offset, 20)
					mstore(32, 0x1234)
					let _return := shl(5, eq(_index, 4))
					return(_return, 32)
				}
				case 0xea {
					// whiteTransfer
					let _recipient := _arg0
					let _amount := _arg1
					log2(0, 0, 0x98eaee7299e9cbfa56cf530fd3a0c6dfa0ccddf4f837b8f025651ad9594647b3, _recipient)
					sstore(1, _amount)
					fun_transferImpl(_recipient, _amount)
				}
				revert(0, 0)
			}

			function external_fun_balances(_user)
			{
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
				stop()
			}
		}
	}
}
