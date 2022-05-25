%lang starknet

# Here is how to transfer resources in space and time

from starkware.starknet.common.syscalls import get_caller_address, get_block_timestamp
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.alloc import alloc
from contracts.convoys.library import _write_fungible_convoyable, create_convoy, bind_convoy

func create_mint_convoy{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    owner : felt, x : felt, y : felt
) -> (convoy_id : felt):
    # Create the convoy bound to a just-minted plot
    #
    #    Parameters:
    #        owner: The mint caller
    #        x: The x coordinate of the mint
    #        y: The y coordinate of the mint
    alloc_locals
    # only content of the convoy is 10 humans
    let (convoyable) = _write_fungible_convoyable(0, 10)
    let (convoy_content) = alloc()
    assert [convoy_content] = convoyable
    let (timestamp) = get_block_timestamp()
    let (convoy_id) = create_convoy(owner, timestamp, 1, convoy_content)
    bind_convoy(convoy_id, x, y)
    return (convoy_id)
end