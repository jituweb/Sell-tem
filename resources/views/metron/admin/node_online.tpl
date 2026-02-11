{include file='admin/main.tpl'}

<style>
.table-container {
    max-width: 1000px;
    margin: 50px auto;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    padding: 20px;
}

h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
}

th, td {
    padding: 12px 10px;
    border-bottom: 1px solid #eee;
}

th {
    background: #f8f8f8;
    font-weight: bold;
    color: #555;
}

th.sortable {
    cursor: pointer;
    user-select: none;
}

.status-online {
    color: #22c55e;
    font-weight: bold;
}

.status-offline {
    color: #ef4444;
    font-weight: bold;
}

.online-count {
    font-weight: bold;
    color: #2563eb;
}

.traffic-zero {
    color: #999;
    font-size: 13px;
}

.total {
    font-size: 18px;
    text-align: center;
    margin-top: 15px;
    color: #555;
}
</style>

<div class="table-container">
    <h2>节点在线情况</h2>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>节点名称</th>
            <th class="sortable" data-key="online">在线人数 ⬍</th>
            <th>状态</th>
            <th>最后上报时间（北京时间）</th>
            <th class="sortable" data-key="traffic">本月使用流量 (GB) ⬍</th>
        </tr>
        </thead>

        <tbody>
        {foreach $data as $node}
            <tr>
                <td>{$node.id}</td>

                <td style="font-weight:600;">{$node.name}</td>

                <td class="online-count" data-online="{$node.online_user}">
                    {$node.online_user}
                </td>

                <td>
                    {if $node.status == 'online'}
                        <span class="status-online">🟢 在线</span>
                    {else}
                        <span class="status-offline">
                            🔴 离线<br>
                            <small style="color:#888;">{$node.updated_at}</small>
                        </span>
                    {/if}
                </td>

                <td>
                    {if $node.status == 'online'}
                        {$node.updated_at}
                    {else}
                        —
                    {/if}
                </td>

                <td data-traffic="{$node.month_traffic}">
                    {if $node.month_traffic > 0}
                        {$node.month_traffic} GB
                    {else}
                        <span class="traffic-zero">0.00 GB</span>
                    {/if}
                </td>
            </tr>
        {/foreach}
        </tbody>
    </table>

    <div class="total">
        🧩 当前所有节点总计在线人数：
        <strong>{$totalOnline}</strong> 人
    </div>
</div>

<script>
(function () {

    if (!document || !document.querySelectorAll) return;

    document.addEventListener('DOMContentLoaded', function () {

        var sortState = {};

        var headers = document.querySelectorAll('th.sortable');
        if (!headers.length) return;

        headers.forEach(function (th) {

            var key = th.dataset.key;
            sortState[key] = false;

            th.addEventListener('click', function () {

                var table = th.closest('table');
                if (!table) return;

                var tbody = table.querySelector('tbody');
                if (!tbody) return;

                var rows = Array.prototype.slice.call(tbody.querySelectorAll('tr'));
                if (!rows.length) return;

                sortState[key] = !sortState[key];
                var asc = sortState[key];

                rows.sort(function (a, b) {
                    var aCell = a.querySelector('[data-' + key + ']');
                    var bCell = b.querySelector('[data-' + key + ']');

                    var av = aCell ? parseFloat(aCell.dataset[key]) || 0 : 0;
                    var bv = bCell ? parseFloat(bCell.dataset[key]) || 0 : 0;

                    return asc ? av - bv : bv - av;
                });

                rows.forEach(function (tr) {
                    tbody.appendChild(tr);
                });

                headers.forEach(function (h) {
                    h.innerHTML = h.innerHTML.replace(/⬆|⬇/, '⬍');
                });

                th.innerHTML = th.innerHTML.replace('⬍', asc ? '⬆' : '⬇');
            });
        });
    });

})();
</script>

{include file='admin/footer.tpl'}
