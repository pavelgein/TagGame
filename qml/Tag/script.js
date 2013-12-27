//.pragma script

var emptyX = 4
var emptyY = 4
var turnNumber = 0;

var abs = Math.abs;

//var lst = column1.children;

function makeTurn(x, y)
{
    return function()
    {
        turnNumber++;
        if (abs(x - emptyX) === 1 && (y === emptyY) ||
            abs(y - emptyY) === 1 && (x === emptyX))
        {
            var lst = column1.children;
            var cell = lst[x].children[y].children[0];
            var emptyCell = lst[emptyX].children[emptyY].children[0];
            var t = cell.text;
            cell.text = emptyCell.text;
            emptyCell.text = t;
            emptyX = x;
            emptyY = y;
            if (rightPosition())
            {
                page.state = 'stateWin';
            }
        }
    }
}

function rightPosition()
{
    var lst = column1.children;
    for (var i = 0; i < 5; i++)
    {
        for (var j = 0; j < 5; j++)
        {
            if (i !== 4 || j !== 4)
            {
                var cell = lst[i].children[j].children[0];
                if (cell.text !== String(i * 5 + j + 1))
                    return false;
            }
        }
    }
    return true;
}


function makeStart()
{
    turnNumber = 0;
    var used = new Array(25);
    for (var z = 0; z < 25; z++)
        used[z] = false;

    function getValue()
    {
        var ind = Math.floor(Math.random() * 100000) % 24 + 1;
        while (used[ind])
            ind = Math.floor(Math.random() * 100000) % 24 + 1;
        used[ind] = true;
        return ind;
    }

    for (var i = 0; i < 5; i++)
    {
        for (var j = 0; j < 5; j++)
        {
            if (i !== 4 || j !== 4)
            {
                //make a text
                var lst = column1.children;
                var textField = lst[i].children[j].children[0];
                textField.text = String(getValue());
            }
            //make an onCliked function
            var mouse = lst[i].children[j].children;
            mouse[1].clicked.connect(makeTurn(i, j));
        }
    }
}

function getEnding(n)
{
    n %= 100;
    if (n > 10 && n < 20)
        return "ходов"
    var rem = n % 10;
    if (rem === 1)
        return "ход";
    if (rem === 0 || rem === 5 || rem === 6 || rem === 7 || rem === 8 || rem === 9)
        return "ходов";
    else
        return "ходa";
}

function makeRightStart()
{
    for (var i = 0; i < 5; i++)
    {
        for (var j = 0; j < 5; j++)
        {
            if (i !== 4 || j !== 4)
            {
                //make a text
                var lst = column1.children;
                var textField = lst[i].children[j].children[0];
                textField.text = String(i * 5 + j + 1);
            }
            //make an onCliked function
            var mouse = lst[i].children[j].children;
            mouse[1].clicked.connect(makeTurn(i, j));
        }
    }
}





