document.addEventListener('turbolinks:load', function() {
    const control = document.querySelector('.sort-by-title');

    if (control) {control.addEventListener('click', sortRowsByTitle )}
})

function sortRowsByTitle() {
    let i;
    const table = document.querySelector('table');
    const rows = table.querySelector('tr');
    const sortedRows = [];

    for (i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        this.querySelector('.octicon-arrow-up').classList.add('hide')
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
    }

    // there is only in memory
    const sortedTable = document.createElement('table');

    sortedTable.classList.add('table')
    // header of table
    sortedTable.appendChild(rows[0])

    for (i = 0; i < sortedRows; i++) {
        sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent;
    const testTitle2 = row2.querySelector('td').textContent;

    if (testTitle1 < testTitle2) {return -1}
    if (testTitle1 > testTitle2) {return 1}
    return 0
}

function compareRowsDesc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent;
    const testTitle2 = row2.querySelector('td').textContent;

    if (testTitle1 < testTitle2) {return 1}
    if (testTitle1 > testTitle2) {return -1}
    return 0
}