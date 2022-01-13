import pytest
import os
from starkware.starknet.testing.starknet import Starknet
import random

@pytest.mark.asyncio
async def test_queue():
    starknet = await Starknet.empty()
    print()

    contract_sim = await starknet.deploy ('sim.cairo')
    print(f'> sim.cairo deployed.')

    TEST_GATES = 'gates_fulladder16_generated'
    contract_gates = await starknet.deploy (f'{TEST_GATES}.cairo')
    print(f'> {TEST_GATES}.cairo deployed.')
    print()

    seed = random.randrange(1,100)
    await contract_sim.admin_initialize_seed(seed).invoke()

    ret = await contract_gates.net_count().call()
    net_count = ret.result.net_count

    await contract_sim.submit_gates_for_simulation(contract_gates.contract_address).invoke()

    print(f'> Content of net_table:')
    for i in range(net_count):
        ret = await contract_sim.admin_view_net_table(i).call()
        print(f'{i} : {ret.result}')
    print()

    ret = await contract_sim.admin_get_event_queue_read_head().call()
    eq_rd_head = ret.result.rd_idx
    ret = await contract_sim.admin_get_event_queue_write_head().call()
    eq_wr_head = ret.result.wr_idx

    print(f'> Content of event_queue:')
    for i in range(eq_rd_head, eq_wr_head):
        ret = await contract_sim.admin_read_event_queue(i).call()
        print(ret.result.event)
    print()

    print(f'> === Running simulation ===')
    ret = await contract_sim.run_simulation(contract_gates.contract_address).invoke()
    print(ret.result)
    print()

    print(f'> Content of net_table:')
    for i in range(net_count):
        ret = await contract_sim.admin_view_net_table(i).call()
        print(f'{i} : {ret.result}')
    print()

    ret = await contract_sim.admin_get_event_queue_read_head().call()
    eq_rd_head = ret.result.rd_idx
    ret = await contract_sim.admin_get_event_queue_write_head().call()
    eq_wr_head = ret.result.wr_idx

    print(f'> Content of event_queue:')
    for i in range(eq_rd_head, eq_wr_head):
        ret = await contract_sim.admin_read_event_queue(i).call()
        print(ret.result.event)
    print()

    ret = await contract_sim.admin_get_gate_queue_read_head().call()
    gq_rd_head = ret.result.rd_idx
    ret = await contract_sim.admin_get_gate_queue_write_head().call()
    gq_wr_head = ret.result.wr_idx

    print(f'> Content of gate_queue:')
    for i in range(gq_rd_head, gq_wr_head):
        ret = await contract_sim.admin_read_gate_queue(i).call()
        print(ret.result)
    print()