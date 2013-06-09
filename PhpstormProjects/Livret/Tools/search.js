
	/*
	
	Copyright (c) 2003. All Rights reserved.
	
	If you use this script, please email me and let me know, thanks!
	
	Andrew Hedges, andrew(at)hedges(dot)name
	
	*/

	d = document;
	stregexp = new RegExp;
	
	function init()
	{
		// set up arrays
		namesArray = new Array("Andrew Haliburton","Brandon Christopher","Christopher Guest","Darius Allqonquin","Ellen Feis","Frenchie Flambee","Georg Hasselman","Haliburton Cheney","Ignacious Gracious","Jakob Nielsen","Keeley Gracious","Lyndon Larouche","Michael Jackson","Novus Primus","Optimus Shmoptimus","Plebian Sly","Quarrulous Ruler","Ravi Shankar","Steve Jobs","Thelonius Monk","Ursa Major","Venial Cavitus","Wallace Gromit","Xerius Guy","Yolan Nolan","Zehra Princess");
		tempArray  = new Array();
		remvdArray = new Array();
		
		// get select object
		selObj = d.getElementById("names");
		
		// rebuild the list
		buildOptions(namesArray);
		
		// clear the input box
		d.getElementById("nrwr").value = "";
		
		// clear the last typed value
		lastVal = "";
		
		// write the number of matches
		writeMatches();
	}
	
	function narrow(str)
	{
		// if the length of str is 0, bypass everything else
		if (str.length == 0)
		{
			buildOptions(namesArray);
			remvdArray.length = 0;
		}
		else
		{
			// clear tempArray
			tempArray.length = 0;
			
			// set up temporary array
			for (i=0;i<selObj.options.length;i++)
			{
				tempArray[tempArray.length] = selObj.options[i].value;
			}
			
			// make case-insensitive regexp
			stregexp = new RegExp(str,"i");
			
			// remove appropriate item(s)
			if (lastVal.length < str.length)
			{
				for (j=selObj.options.length-1;j>-1;j--)
				{
					if (selObj.options[j].value.match(stregexp) == null)
					{
						// remove the item
						tempArray.splice(j,1);
					}
				}
			}
			
			// add appropriate item(s)
			else
			{
				// if a removed item matches the new pattern, add it to the list of names
				for (k=remvdArray.length-1;k>-1;k--)
				{
					tempName = remvdArray[k];
					
					if (tempName.match(stregexp) != null)
					{
						tempArray[tempArray.length] = tempName;
					}
				}
				
				// sort the names array
				tempArray.sort();
			}
			
			// build the new select list
			buildOptions(tempArray);
		}
		
		// remember the last value on which we narrowed
		lastVal = str;
		
		// write the number of matches
		writeMatches();
	}
	
	function buildOptions(arrayName)
	{
		// clear the select list
		selObj.options.length = 0;
		
		// build the select list
		for (l=0;l<arrayName.length;l++)
		{
			selObj.options[l] = new Option(arrayName[l]);
		}
		
		// remember which items were removed
		buildRemvd();
	}
	
	function buildRemvd()
	{
		// clear the removed items array
		remvdArray.length = 0;
		
		// build the removed items array
		for (m=namesArray.length-1;m>-1;m--)
		{
			if (namesArray[m].match(stregexp) == null)
			{
				// remember which item was removed
				remvdArray[remvdArray.length] = namesArray[m];
			}
		}
	}
	
	function writeMatches()
	{
		if (selObj.options.length == 1)
		{
			d.getElementById("matches").innerHTML = "1 match";
		}
		else
		{
			d.getElementById("matches").innerHTML = selObj.options.length + " matches";
		}
	}