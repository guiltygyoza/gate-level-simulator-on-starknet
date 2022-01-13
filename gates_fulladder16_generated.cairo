%lang starknet
%builtins pedersen range_check

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.alloc import alloc

## Netlist:
## N0, N1 -> G0 (XOR) -> N77
## N0, N1 -> G1 (AND) -> N78
## N2, N3 -> G2 (XOR) -> N32
## N78, N32 -> G3 (XOR) -> N79
## N78, N32 -> G4 (AND) -> N33
## N2, N3 -> G5 (AND) -> N34
## N33, N34 -> G6 (OR) -> N80
## N4, N5 -> G7 (XOR) -> N35
## N80, N35 -> G8 (XOR) -> N81
## N80, N35 -> G9 (AND) -> N36
## N4, N5 -> G10 (AND) -> N37
## N36, N37 -> G11 (OR) -> N82
## N6, N7 -> G12 (XOR) -> N38
## N82, N38 -> G13 (XOR) -> N83
## N82, N38 -> G14 (AND) -> N39
## N6, N7 -> G15 (AND) -> N40
## N39, N40 -> G16 (OR) -> N84
## N8, N9 -> G17 (XOR) -> N41
## N84, N41 -> G18 (XOR) -> N85
## N84, N41 -> G19 (AND) -> N42
## N8, N9 -> G20 (AND) -> N43
## N42, N43 -> G21 (OR) -> N86
## N10, N11 -> G22 (XOR) -> N44
## N86, N44 -> G23 (XOR) -> N87
## N86, N44 -> G24 (AND) -> N45
## N10, N11 -> G25 (AND) -> N46
## N45, N46 -> G26 (OR) -> N88
## N12, N13 -> G27 (XOR) -> N47
## N88, N47 -> G28 (XOR) -> N89
## N88, N47 -> G29 (AND) -> N48
## N12, N13 -> G30 (AND) -> N49
## N48, N49 -> G31 (OR) -> N90
## N14, N15 -> G32 (XOR) -> N50
## N90, N50 -> G33 (XOR) -> N91
## N90, N50 -> G34 (AND) -> N51
## N14, N15 -> G35 (AND) -> N52
## N51, N52 -> G36 (OR) -> N92
## N16, N17 -> G37 (XOR) -> N53
## N92, N53 -> G38 (XOR) -> N93
## N92, N53 -> G39 (AND) -> N54
## N16, N17 -> G40 (AND) -> N55
## N54, N55 -> G41 (OR) -> N94
## N18, N19 -> G42 (XOR) -> N56
## N94, N56 -> G43 (XOR) -> N95
## N94, N56 -> G44 (AND) -> N57
## N18, N19 -> G45 (AND) -> N58
## N57, N58 -> G46 (OR) -> N96
## N20, N21 -> G47 (XOR) -> N59
## N96, N59 -> G48 (XOR) -> N97
## N96, N59 -> G49 (AND) -> N60
## N20, N21 -> G50 (AND) -> N61
## N60, N61 -> G51 (OR) -> N98
## N22, N23 -> G52 (XOR) -> N62
## N98, N62 -> G53 (XOR) -> N99
## N98, N62 -> G54 (AND) -> N63
## N22, N23 -> G55 (AND) -> N64
## N63, N64 -> G56 (OR) -> N100
## N24, N25 -> G57 (XOR) -> N65
## N100, N65 -> G58 (XOR) -> N101
## N100, N65 -> G59 (AND) -> N66
## N24, N25 -> G60 (AND) -> N67
## N66, N67 -> G61 (OR) -> N102
## N26, N27 -> G62 (XOR) -> N68
## N102, N68 -> G63 (XOR) -> N103
## N102, N68 -> G64 (AND) -> N69
## N26, N27 -> G65 (AND) -> N70
## N69, N70 -> G66 (OR) -> N104
## N28, N29 -> G67 (XOR) -> N71
## N104, N71 -> G68 (XOR) -> N105
## N104, N71 -> G69 (AND) -> N72
## N28, N29 -> G70 (AND) -> N73
## N72, N73 -> G71 (OR) -> N106
## N30, N31 -> G72 (XOR) -> N74
## N106, N74 -> G73 (XOR) -> N107
## N106, N74 -> G74 (AND) -> N75
## N30, N31 -> G75 (AND) -> N76
## N75, N76 -> G76 (OR) -> N108

## Constants viewable:
const GATE_COUNT = 77
@view
func gate_count {} () -> (gate_count : felt):
    return (GATE_COUNT)
end

const NET_COUNT = 109
@view
func net_count {} () -> (net_count : felt):
    return (NET_COUNT)
end

const INPUT_NET_COUNT = 32
@view
func input_net_count {} () -> (input_net_count : felt):
    return (INPUT_NET_COUNT)
end

const OUTPUT_NET_COUNT = 32
@view
func output_net_count {} () -> (output_net_count : felt):
    return (OUTPUT_NET_COUNT)
end

## Net value initialization:
@view
func init_net_values {range_check_ptr} () -> (
        arr_len : felt,
        arr : felt*
    ):
    alloc_locals
    let (local arr) = alloc()
    assert [arr+0] = 2
    assert [arr+1] = 2
    assert [arr+2] = 2
    assert [arr+3] = 2
    assert [arr+4] = 2
    assert [arr+5] = 2
    assert [arr+6] = 2
    assert [arr+7] = 2
    assert [arr+8] = 2
    assert [arr+9] = 2
    assert [arr+10] = 2
    assert [arr+11] = 2
    assert [arr+12] = 2
    assert [arr+13] = 2
    assert [arr+14] = 2
    assert [arr+15] = 2
    assert [arr+16] = 2
    assert [arr+17] = 2
    assert [arr+18] = 2
    assert [arr+19] = 2
    assert [arr+20] = 2
    assert [arr+21] = 2
    assert [arr+22] = 2
    assert [arr+23] = 2
    assert [arr+24] = 2
    assert [arr+25] = 2
    assert [arr+26] = 2
    assert [arr+27] = 2
    assert [arr+28] = 2
    assert [arr+29] = 2
    assert [arr+30] = 2
    assert [arr+31] = 2
    assert [arr+32] = 2
    assert [arr+33] = 2
    assert [arr+34] = 2
    assert [arr+35] = 2
    assert [arr+36] = 2
    assert [arr+37] = 2
    assert [arr+38] = 2
    assert [arr+39] = 2
    assert [arr+40] = 2
    assert [arr+41] = 2
    assert [arr+42] = 2
    assert [arr+43] = 2
    assert [arr+44] = 2
    assert [arr+45] = 2
    assert [arr+46] = 2
    assert [arr+47] = 2
    assert [arr+48] = 2
    assert [arr+49] = 2
    assert [arr+50] = 2
    assert [arr+51] = 2
    assert [arr+52] = 2
    assert [arr+53] = 2
    assert [arr+54] = 2
    assert [arr+55] = 2
    assert [arr+56] = 2
    assert [arr+57] = 2
    assert [arr+58] = 2
    assert [arr+59] = 2
    assert [arr+60] = 2
    assert [arr+61] = 2
    assert [arr+62] = 2
    assert [arr+63] = 2
    assert [arr+64] = 2
    assert [arr+65] = 2
    assert [arr+66] = 2
    assert [arr+67] = 2
    assert [arr+68] = 2
    assert [arr+69] = 2
    assert [arr+70] = 2
    assert [arr+71] = 2
    assert [arr+72] = 2
    assert [arr+73] = 2
    assert [arr+74] = 2
    assert [arr+75] = 2
    assert [arr+76] = 2
    assert [arr+77] = 2
    assert [arr+78] = 2
    assert [arr+79] = 2
    assert [arr+80] = 2
    assert [arr+81] = 2
    assert [arr+82] = 2
    assert [arr+83] = 2
    assert [arr+84] = 2
    assert [arr+85] = 2
    assert [arr+86] = 2
    assert [arr+87] = 2
    assert [arr+88] = 2
    assert [arr+89] = 2
    assert [arr+90] = 2
    assert [arr+91] = 2
    assert [arr+92] = 2
    assert [arr+93] = 2
    assert [arr+94] = 2
    assert [arr+95] = 2
    assert [arr+96] = 2
    assert [arr+97] = 2
    assert [arr+98] = 2
    assert [arr+99] = 2
    assert [arr+100] = 2
    assert [arr+101] = 2
    assert [arr+102] = 2
    assert [arr+103] = 2
    assert [arr+104] = 2
    assert [arr+105] = 2
    assert [arr+106] = 2
    assert [arr+107] = 2
    assert [arr+108] = 2
    return (109, arr)
end

## Gate index-to-type lookup:
@view
func gate_idx_to_typ {range_check_ptr} (gate_idx : felt) -> (gate_typ : felt):
    alloc_locals
    if gate_idx == 0:
        return (2)
    end
    if gate_idx == 1:
        return (1)
    end
    if gate_idx == 2:
        return (2)
    end
    if gate_idx == 3:
        return (2)
    end
    if gate_idx == 4:
        return (1)
    end
    if gate_idx == 5:
        return (1)
    end
    if gate_idx == 6:
        return (0)
    end
    if gate_idx == 7:
        return (2)
    end
    if gate_idx == 8:
        return (2)
    end
    if gate_idx == 9:
        return (1)
    end
    if gate_idx == 10:
        return (1)
    end
    if gate_idx == 11:
        return (0)
    end
    if gate_idx == 12:
        return (2)
    end
    if gate_idx == 13:
        return (2)
    end
    if gate_idx == 14:
        return (1)
    end
    if gate_idx == 15:
        return (1)
    end
    if gate_idx == 16:
        return (0)
    end
    if gate_idx == 17:
        return (2)
    end
    if gate_idx == 18:
        return (2)
    end
    if gate_idx == 19:
        return (1)
    end
    if gate_idx == 20:
        return (1)
    end
    if gate_idx == 21:
        return (0)
    end
    if gate_idx == 22:
        return (2)
    end
    if gate_idx == 23:
        return (2)
    end
    if gate_idx == 24:
        return (1)
    end
    if gate_idx == 25:
        return (1)
    end
    if gate_idx == 26:
        return (0)
    end
    if gate_idx == 27:
        return (2)
    end
    if gate_idx == 28:
        return (2)
    end
    if gate_idx == 29:
        return (1)
    end
    if gate_idx == 30:
        return (1)
    end
    if gate_idx == 31:
        return (0)
    end
    if gate_idx == 32:
        return (2)
    end
    if gate_idx == 33:
        return (2)
    end
    if gate_idx == 34:
        return (1)
    end
    if gate_idx == 35:
        return (1)
    end
    if gate_idx == 36:
        return (0)
    end
    if gate_idx == 37:
        return (2)
    end
    if gate_idx == 38:
        return (2)
    end
    if gate_idx == 39:
        return (1)
    end
    if gate_idx == 40:
        return (1)
    end
    if gate_idx == 41:
        return (0)
    end
    if gate_idx == 42:
        return (2)
    end
    if gate_idx == 43:
        return (2)
    end
    if gate_idx == 44:
        return (1)
    end
    if gate_idx == 45:
        return (1)
    end
    if gate_idx == 46:
        return (0)
    end
    if gate_idx == 47:
        return (2)
    end
    if gate_idx == 48:
        return (2)
    end
    if gate_idx == 49:
        return (1)
    end
    if gate_idx == 50:
        return (1)
    end
    if gate_idx == 51:
        return (0)
    end
    if gate_idx == 52:
        return (2)
    end
    if gate_idx == 53:
        return (2)
    end
    if gate_idx == 54:
        return (1)
    end
    if gate_idx == 55:
        return (1)
    end
    if gate_idx == 56:
        return (0)
    end
    if gate_idx == 57:
        return (2)
    end
    if gate_idx == 58:
        return (2)
    end
    if gate_idx == 59:
        return (1)
    end
    if gate_idx == 60:
        return (1)
    end
    if gate_idx == 61:
        return (0)
    end
    if gate_idx == 62:
        return (2)
    end
    if gate_idx == 63:
        return (2)
    end
    if gate_idx == 64:
        return (1)
    end
    if gate_idx == 65:
        return (1)
    end
    if gate_idx == 66:
        return (0)
    end
    if gate_idx == 67:
        return (2)
    end
    if gate_idx == 68:
        return (2)
    end
    if gate_idx == 69:
        return (1)
    end
    if gate_idx == 70:
        return (1)
    end
    if gate_idx == 71:
        return (0)
    end
    if gate_idx == 72:
        return (2)
    end
    if gate_idx == 73:
        return (2)
    end
    if gate_idx == 74:
        return (1)
    end
    if gate_idx == 75:
        return (1)
    end
    if gate_idx == 76:
        return (0)
    else:
        ## nonexistent gate index
        return (3) # 3 is an undefined gate type
    end
end

## For querying fanout gates of a given net:
@view
func fanout_gate_given_net  {range_check_ptr} (
        net_idx : felt
    ) -> (
        gate_idx_arr_len : felt,
        gate_idx_arr : felt*
    ):
    ## input felt: net index
    ## output felt: array of gate indices
    alloc_locals
    let (local gate_idx_arr) = alloc()

    if net_idx == 0:
        assert [gate_idx_arr + 0] = 1
        assert [gate_idx_arr + 1] = 0
        return (2, gate_idx_arr)
    end
    if net_idx == 1:
        assert [gate_idx_arr + 0] = 1
        assert [gate_idx_arr + 1] = 0
        return (2, gate_idx_arr)
    end
    if net_idx == 2:
        assert [gate_idx_arr + 0] = 5
        assert [gate_idx_arr + 1] = 2
        return (2, gate_idx_arr)
    end
    if net_idx == 3:
        assert [gate_idx_arr + 0] = 5
        assert [gate_idx_arr + 1] = 2
        return (2, gate_idx_arr)
    end
    if net_idx == 4:
        assert [gate_idx_arr + 0] = 10
        assert [gate_idx_arr + 1] = 7
        return (2, gate_idx_arr)
    end
    if net_idx == 5:
        assert [gate_idx_arr + 0] = 10
        assert [gate_idx_arr + 1] = 7
        return (2, gate_idx_arr)
    end
    if net_idx == 6:
        assert [gate_idx_arr + 0] = 12
        assert [gate_idx_arr + 1] = 15
        return (2, gate_idx_arr)
    end
    if net_idx == 7:
        assert [gate_idx_arr + 0] = 12
        assert [gate_idx_arr + 1] = 15
        return (2, gate_idx_arr)
    end
    if net_idx == 8:
        assert [gate_idx_arr + 0] = 20
        assert [gate_idx_arr + 1] = 17
        return (2, gate_idx_arr)
    end
    if net_idx == 9:
        assert [gate_idx_arr + 0] = 20
        assert [gate_idx_arr + 1] = 17
        return (2, gate_idx_arr)
    end
    if net_idx == 10:
        assert [gate_idx_arr + 0] = 25
        assert [gate_idx_arr + 1] = 22
        return (2, gate_idx_arr)
    end
    if net_idx == 11:
        assert [gate_idx_arr + 0] = 25
        assert [gate_idx_arr + 1] = 22
        return (2, gate_idx_arr)
    end
    if net_idx == 12:
        assert [gate_idx_arr + 0] = 30
        assert [gate_idx_arr + 1] = 27
        return (2, gate_idx_arr)
    end
    if net_idx == 13:
        assert [gate_idx_arr + 0] = 30
        assert [gate_idx_arr + 1] = 27
        return (2, gate_idx_arr)
    end
    if net_idx == 14:
        assert [gate_idx_arr + 0] = 35
        assert [gate_idx_arr + 1] = 32
        return (2, gate_idx_arr)
    end
    if net_idx == 15:
        assert [gate_idx_arr + 0] = 35
        assert [gate_idx_arr + 1] = 32
        return (2, gate_idx_arr)
    end
    if net_idx == 16:
        assert [gate_idx_arr + 0] = 40
        assert [gate_idx_arr + 1] = 37
        return (2, gate_idx_arr)
    end
    if net_idx == 17:
        assert [gate_idx_arr + 0] = 40
        assert [gate_idx_arr + 1] = 37
        return (2, gate_idx_arr)
    end
    if net_idx == 18:
        assert [gate_idx_arr + 0] = 45
        assert [gate_idx_arr + 1] = 42
        return (2, gate_idx_arr)
    end
    if net_idx == 19:
        assert [gate_idx_arr + 0] = 45
        assert [gate_idx_arr + 1] = 42
        return (2, gate_idx_arr)
    end
    if net_idx == 20:
        assert [gate_idx_arr + 0] = 50
        assert [gate_idx_arr + 1] = 47
        return (2, gate_idx_arr)
    end
    if net_idx == 21:
        assert [gate_idx_arr + 0] = 50
        assert [gate_idx_arr + 1] = 47
        return (2, gate_idx_arr)
    end
    if net_idx == 22:
        assert [gate_idx_arr + 0] = 52
        assert [gate_idx_arr + 1] = 55
        return (2, gate_idx_arr)
    end
    if net_idx == 23:
        assert [gate_idx_arr + 0] = 52
        assert [gate_idx_arr + 1] = 55
        return (2, gate_idx_arr)
    end
    if net_idx == 24:
        assert [gate_idx_arr + 0] = 57
        assert [gate_idx_arr + 1] = 60
        return (2, gate_idx_arr)
    end
    if net_idx == 25:
        assert [gate_idx_arr + 0] = 57
        assert [gate_idx_arr + 1] = 60
        return (2, gate_idx_arr)
    end
    if net_idx == 26:
        assert [gate_idx_arr + 0] = 65
        assert [gate_idx_arr + 1] = 62
        return (2, gate_idx_arr)
    end
    if net_idx == 27:
        assert [gate_idx_arr + 0] = 65
        assert [gate_idx_arr + 1] = 62
        return (2, gate_idx_arr)
    end
    if net_idx == 28:
        assert [gate_idx_arr + 0] = 70
        assert [gate_idx_arr + 1] = 67
        return (2, gate_idx_arr)
    end
    if net_idx == 29:
        assert [gate_idx_arr + 0] = 70
        assert [gate_idx_arr + 1] = 67
        return (2, gate_idx_arr)
    end
    if net_idx == 30:
        assert [gate_idx_arr + 0] = 72
        assert [gate_idx_arr + 1] = 75
        return (2, gate_idx_arr)
    end
    if net_idx == 31:
        assert [gate_idx_arr + 0] = 72
        assert [gate_idx_arr + 1] = 75
        return (2, gate_idx_arr)
    end
    if net_idx == 32:
        assert [gate_idx_arr + 0] = 3
        assert [gate_idx_arr + 1] = 4
        return (2, gate_idx_arr)
    end
    if net_idx == 33:
        assert [gate_idx_arr + 0] = 6
        return (1, gate_idx_arr)
    end
    if net_idx == 34:
        assert [gate_idx_arr + 0] = 6
        return (1, gate_idx_arr)
    end
    if net_idx == 35:
        assert [gate_idx_arr + 0] = 8
        assert [gate_idx_arr + 1] = 9
        return (2, gate_idx_arr)
    end
    if net_idx == 36:
        assert [gate_idx_arr + 0] = 11
        return (1, gate_idx_arr)
    end
    if net_idx == 37:
        assert [gate_idx_arr + 0] = 11
        return (1, gate_idx_arr)
    end
    if net_idx == 38:
        assert [gate_idx_arr + 0] = 13
        assert [gate_idx_arr + 1] = 14
        return (2, gate_idx_arr)
    end
    if net_idx == 39:
        assert [gate_idx_arr + 0] = 16
        return (1, gate_idx_arr)
    end
    if net_idx == 40:
        assert [gate_idx_arr + 0] = 16
        return (1, gate_idx_arr)
    end
    if net_idx == 41:
        assert [gate_idx_arr + 0] = 18
        assert [gate_idx_arr + 1] = 19
        return (2, gate_idx_arr)
    end
    if net_idx == 42:
        assert [gate_idx_arr + 0] = 21
        return (1, gate_idx_arr)
    end
    if net_idx == 43:
        assert [gate_idx_arr + 0] = 21
        return (1, gate_idx_arr)
    end
    if net_idx == 44:
        assert [gate_idx_arr + 0] = 24
        assert [gate_idx_arr + 1] = 23
        return (2, gate_idx_arr)
    end
    if net_idx == 45:
        assert [gate_idx_arr + 0] = 26
        return (1, gate_idx_arr)
    end
    if net_idx == 46:
        assert [gate_idx_arr + 0] = 26
        return (1, gate_idx_arr)
    end
    if net_idx == 47:
        assert [gate_idx_arr + 0] = 28
        assert [gate_idx_arr + 1] = 29
        return (2, gate_idx_arr)
    end
    if net_idx == 48:
        assert [gate_idx_arr + 0] = 31
        return (1, gate_idx_arr)
    end
    if net_idx == 49:
        assert [gate_idx_arr + 0] = 31
        return (1, gate_idx_arr)
    end
    if net_idx == 50:
        assert [gate_idx_arr + 0] = 33
        assert [gate_idx_arr + 1] = 34
        return (2, gate_idx_arr)
    end
    if net_idx == 51:
        assert [gate_idx_arr + 0] = 36
        return (1, gate_idx_arr)
    end
    if net_idx == 52:
        assert [gate_idx_arr + 0] = 36
        return (1, gate_idx_arr)
    end
    if net_idx == 53:
        assert [gate_idx_arr + 0] = 38
        assert [gate_idx_arr + 1] = 39
        return (2, gate_idx_arr)
    end
    if net_idx == 54:
        assert [gate_idx_arr + 0] = 41
        return (1, gate_idx_arr)
    end
    if net_idx == 55:
        assert [gate_idx_arr + 0] = 41
        return (1, gate_idx_arr)
    end
    if net_idx == 56:
        assert [gate_idx_arr + 0] = 43
        assert [gate_idx_arr + 1] = 44
        return (2, gate_idx_arr)
    end
    if net_idx == 57:
        assert [gate_idx_arr + 0] = 46
        return (1, gate_idx_arr)
    end
    if net_idx == 58:
        assert [gate_idx_arr + 0] = 46
        return (1, gate_idx_arr)
    end
    if net_idx == 59:
        assert [gate_idx_arr + 0] = 48
        assert [gate_idx_arr + 1] = 49
        return (2, gate_idx_arr)
    end
    if net_idx == 60:
        assert [gate_idx_arr + 0] = 51
        return (1, gate_idx_arr)
    end
    if net_idx == 61:
        assert [gate_idx_arr + 0] = 51
        return (1, gate_idx_arr)
    end
    if net_idx == 62:
        assert [gate_idx_arr + 0] = 54
        assert [gate_idx_arr + 1] = 53
        return (2, gate_idx_arr)
    end
    if net_idx == 63:
        assert [gate_idx_arr + 0] = 56
        return (1, gate_idx_arr)
    end
    if net_idx == 64:
        assert [gate_idx_arr + 0] = 56
        return (1, gate_idx_arr)
    end
    if net_idx == 65:
        assert [gate_idx_arr + 0] = 59
        assert [gate_idx_arr + 1] = 58
        return (2, gate_idx_arr)
    end
    if net_idx == 66:
        assert [gate_idx_arr + 0] = 61
        return (1, gate_idx_arr)
    end
    if net_idx == 67:
        assert [gate_idx_arr + 0] = 61
        return (1, gate_idx_arr)
    end
    if net_idx == 68:
        assert [gate_idx_arr + 0] = 63
        assert [gate_idx_arr + 1] = 64
        return (2, gate_idx_arr)
    end
    if net_idx == 69:
        assert [gate_idx_arr + 0] = 66
        return (1, gate_idx_arr)
    end
    if net_idx == 70:
        assert [gate_idx_arr + 0] = 66
        return (1, gate_idx_arr)
    end
    if net_idx == 71:
        assert [gate_idx_arr + 0] = 69
        assert [gate_idx_arr + 1] = 68
        return (2, gate_idx_arr)
    end
    if net_idx == 72:
        assert [gate_idx_arr + 0] = 71
        return (1, gate_idx_arr)
    end
    if net_idx == 73:
        assert [gate_idx_arr + 0] = 71
        return (1, gate_idx_arr)
    end
    if net_idx == 74:
        assert [gate_idx_arr + 0] = 73
        assert [gate_idx_arr + 1] = 74
        return (2, gate_idx_arr)
    end
    if net_idx == 75:
        assert [gate_idx_arr + 0] = 76
        return (1, gate_idx_arr)
    end
    if net_idx == 76:
        assert [gate_idx_arr + 0] = 76
        return (1, gate_idx_arr)
    end
    if net_idx == 77:
        return (0, gate_idx_arr)
    end
    if net_idx == 78:
        assert [gate_idx_arr + 0] = 3
        assert [gate_idx_arr + 1] = 4
        return (2, gate_idx_arr)
    end
    if net_idx == 79:
        return (0, gate_idx_arr)
    end
    if net_idx == 80:
        assert [gate_idx_arr + 0] = 8
        assert [gate_idx_arr + 1] = 9
        return (2, gate_idx_arr)
    end
    if net_idx == 81:
        return (0, gate_idx_arr)
    end
    if net_idx == 82:
        assert [gate_idx_arr + 0] = 13
        assert [gate_idx_arr + 1] = 14
        return (2, gate_idx_arr)
    end
    if net_idx == 83:
        return (0, gate_idx_arr)
    end
    if net_idx == 84:
        assert [gate_idx_arr + 0] = 18
        assert [gate_idx_arr + 1] = 19
        return (2, gate_idx_arr)
    end
    if net_idx == 85:
        return (0, gate_idx_arr)
    end
    if net_idx == 86:
        assert [gate_idx_arr + 0] = 24
        assert [gate_idx_arr + 1] = 23
        return (2, gate_idx_arr)
    end
    if net_idx == 87:
        return (0, gate_idx_arr)
    end
    if net_idx == 88:
        assert [gate_idx_arr + 0] = 28
        assert [gate_idx_arr + 1] = 29
        return (2, gate_idx_arr)
    end
    if net_idx == 89:
        return (0, gate_idx_arr)
    end
    if net_idx == 90:
        assert [gate_idx_arr + 0] = 33
        assert [gate_idx_arr + 1] = 34
        return (2, gate_idx_arr)
    end
    if net_idx == 91:
        return (0, gate_idx_arr)
    end
    if net_idx == 92:
        assert [gate_idx_arr + 0] = 38
        assert [gate_idx_arr + 1] = 39
        return (2, gate_idx_arr)
    end
    if net_idx == 93:
        return (0, gate_idx_arr)
    end
    if net_idx == 94:
        assert [gate_idx_arr + 0] = 43
        assert [gate_idx_arr + 1] = 44
        return (2, gate_idx_arr)
    end
    if net_idx == 95:
        return (0, gate_idx_arr)
    end
    if net_idx == 96:
        assert [gate_idx_arr + 0] = 48
        assert [gate_idx_arr + 1] = 49
        return (2, gate_idx_arr)
    end
    if net_idx == 97:
        return (0, gate_idx_arr)
    end
    if net_idx == 98:
        assert [gate_idx_arr + 0] = 54
        assert [gate_idx_arr + 1] = 53
        return (2, gate_idx_arr)
    end
    if net_idx == 99:
        return (0, gate_idx_arr)
    end
    if net_idx == 100:
        assert [gate_idx_arr + 0] = 59
        assert [gate_idx_arr + 1] = 58
        return (2, gate_idx_arr)
    end
    if net_idx == 101:
        return (0, gate_idx_arr)
    end
    if net_idx == 102:
        assert [gate_idx_arr + 0] = 63
        assert [gate_idx_arr + 1] = 64
        return (2, gate_idx_arr)
    end
    if net_idx == 103:
        return (0, gate_idx_arr)
    end
    if net_idx == 104:
        assert [gate_idx_arr + 0] = 69
        assert [gate_idx_arr + 1] = 68
        return (2, gate_idx_arr)
    end
    if net_idx == 105:
        return (0, gate_idx_arr)
    end
    if net_idx == 106:
        assert [gate_idx_arr + 0] = 73
        assert [gate_idx_arr + 1] = 74
        return (2, gate_idx_arr)
    end
    if net_idx == 107:
        return (0, gate_idx_arr)
    end
    if net_idx == 108:
        return (0, gate_idx_arr)
    else:
        ## nonexistent net index
        return (0, gate_idx_arr)
    end
end

## Gate-to-ports lookup:
@view
func gate_ports_lookup {range_check_ptr} (gate_idx : felt) -> (vo_net_idx : felt, vi_1_net_idx : felt, vi_2_net_idx : felt):
    if gate_idx == 0:
        return (77,0,1)
    end
    if gate_idx == 1:
        return (78,0,1)
    end
    if gate_idx == 2:
        return (32,2,3)
    end
    if gate_idx == 3:
        return (79,78,32)
    end
    if gate_idx == 4:
        return (33,78,32)
    end
    if gate_idx == 5:
        return (34,2,3)
    end
    if gate_idx == 6:
        return (80,33,34)
    end
    if gate_idx == 7:
        return (35,4,5)
    end
    if gate_idx == 8:
        return (81,80,35)
    end
    if gate_idx == 9:
        return (36,80,35)
    end
    if gate_idx == 10:
        return (37,4,5)
    end
    if gate_idx == 11:
        return (82,36,37)
    end
    if gate_idx == 12:
        return (38,6,7)
    end
    if gate_idx == 13:
        return (83,82,38)
    end
    if gate_idx == 14:
        return (39,82,38)
    end
    if gate_idx == 15:
        return (40,6,7)
    end
    if gate_idx == 16:
        return (84,39,40)
    end
    if gate_idx == 17:
        return (41,8,9)
    end
    if gate_idx == 18:
        return (85,84,41)
    end
    if gate_idx == 19:
        return (42,84,41)
    end
    if gate_idx == 20:
        return (43,8,9)
    end
    if gate_idx == 21:
        return (86,42,43)
    end
    if gate_idx == 22:
        return (44,10,11)
    end
    if gate_idx == 23:
        return (87,86,44)
    end
    if gate_idx == 24:
        return (45,86,44)
    end
    if gate_idx == 25:
        return (46,10,11)
    end
    if gate_idx == 26:
        return (88,45,46)
    end
    if gate_idx == 27:
        return (47,12,13)
    end
    if gate_idx == 28:
        return (89,88,47)
    end
    if gate_idx == 29:
        return (48,88,47)
    end
    if gate_idx == 30:
        return (49,12,13)
    end
    if gate_idx == 31:
        return (90,48,49)
    end
    if gate_idx == 32:
        return (50,14,15)
    end
    if gate_idx == 33:
        return (91,90,50)
    end
    if gate_idx == 34:
        return (51,90,50)
    end
    if gate_idx == 35:
        return (52,14,15)
    end
    if gate_idx == 36:
        return (92,51,52)
    end
    if gate_idx == 37:
        return (53,16,17)
    end
    if gate_idx == 38:
        return (93,92,53)
    end
    if gate_idx == 39:
        return (54,92,53)
    end
    if gate_idx == 40:
        return (55,16,17)
    end
    if gate_idx == 41:
        return (94,54,55)
    end
    if gate_idx == 42:
        return (56,18,19)
    end
    if gate_idx == 43:
        return (95,94,56)
    end
    if gate_idx == 44:
        return (57,94,56)
    end
    if gate_idx == 45:
        return (58,18,19)
    end
    if gate_idx == 46:
        return (96,57,58)
    end
    if gate_idx == 47:
        return (59,20,21)
    end
    if gate_idx == 48:
        return (97,96,59)
    end
    if gate_idx == 49:
        return (60,96,59)
    end
    if gate_idx == 50:
        return (61,20,21)
    end
    if gate_idx == 51:
        return (98,60,61)
    end
    if gate_idx == 52:
        return (62,22,23)
    end
    if gate_idx == 53:
        return (99,98,62)
    end
    if gate_idx == 54:
        return (63,98,62)
    end
    if gate_idx == 55:
        return (64,22,23)
    end
    if gate_idx == 56:
        return (100,63,64)
    end
    if gate_idx == 57:
        return (65,24,25)
    end
    if gate_idx == 58:
        return (101,100,65)
    end
    if gate_idx == 59:
        return (66,100,65)
    end
    if gate_idx == 60:
        return (67,24,25)
    end
    if gate_idx == 61:
        return (102,66,67)
    end
    if gate_idx == 62:
        return (68,26,27)
    end
    if gate_idx == 63:
        return (103,102,68)
    end
    if gate_idx == 64:
        return (69,102,68)
    end
    if gate_idx == 65:
        return (70,26,27)
    end
    if gate_idx == 66:
        return (104,69,70)
    end
    if gate_idx == 67:
        return (71,28,29)
    end
    if gate_idx == 68:
        return (105,104,71)
    end
    if gate_idx == 69:
        return (72,104,71)
    end
    if gate_idx == 70:
        return (73,28,29)
    end
    if gate_idx == 71:
        return (106,72,73)
    end
    if gate_idx == 72:
        return (74,30,31)
    end
    if gate_idx == 73:
        return (107,106,74)
    end
    if gate_idx == 74:
        return (75,106,74)
    end
    if gate_idx == 75:
        return (76,30,31)
    end
    if gate_idx == 76:
        return (108,75,76)
    else:
        ## nonexistent gate index
        return (0,0,0)
    end
end
