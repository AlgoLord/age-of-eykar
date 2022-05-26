%lang starknet

from contracts.map.szudzik import szudzik, lgc #, reversed_szudzik

func random_szudzik{range_check_ptr}(x: felt, y: felt, loop: felt) -> (res: felt):
    let (temp) = szudzik(x, y)
    return lgc(temp, loop)
end

@view
func test_szudzik{range_check_ptr}():
    alloc_locals

    let (szudzik1) = random_szudzik(0, 0, 2)
    let (szudzik2) = random_szudzik(1, 4, 2)
    let (szudzik3) = random_szudzik(3618502788666131213697322783095070105623107215331596699973092056135872020476, 10456, 1)
    let (szudzik4) = random_szudzik(3618502788666131213697322783095070105623107215331596699973092056135871341988, 3618502788666131213697322783095070105623107215331596699973092056135862020482, 1)

    assert szudzik1 = 896570056
    assert szudzik2 = 813385950
    assert szudzik3 = 655740424
    assert szudzik4 = 839877197

    return ()
end

# todo: write reversed szudzik
#@view
#func test_reversed_szudzik{}():
#    let reversed_szudzik1 = reversed_szudzik(0)
#    let reversed_szudzik2 = reversed_szudzik(66)
#    let reversed_szudzik3 = reversed_szudzik(437311753)
#    let reversed_szudzik4 = reversed_szudzik(399999881356994)

#    assert reversed_szudzik1 = (0, 0)
#    assert reversed_szudzik2 = (1, 4)
#    assert reversed_szudzik3 = (3618502788666131213697322783095070105623107215331596699973092056135872020476, 10456)
#    assert reversed_szudzik4 = (3618502788666131213697322783095070105623107215331596699973092056135871341988, 3618502788666131213697322783095070105623107215331596699973092056135862020482)

#    return ()
#end