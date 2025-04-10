import std.stdio, std.string, std.conv, std.algorithm;
void main()
{
	while(true) {
		auto input = readln.chomp.split(",");
		int[] hand;
		foreach(e; input)
			hand ~= e.to!int;

		if(!hand.length)
			break;
		hand.sort();
		(new PokerHand(hand)).hand.writeln;
	}
}

class PokerHand
{
	int[] cards;
	string hand;

	this(int[] cards)
	in
	{
		assert(cards.length == 5);
		assert(cards.isSorted);
	}
	body
	{
		this.cards = cards.dup;
		hand = getHandName();
	}

	private string getHandName()
	{
		if(isFourCard)
			return "four card";
		else if(isFullHouse)
			return "full house";
		else if(isStraight)
			return "straight";
		else if(isThreeCard)
			return "three card";
		else if(isTwoPair)
			return "two pair";
		else if(isOnePair)
			return "one pair";
		else
			return "null";
	}

	private bool isFourCard()
	{
		return maxNumOfSameCards == 4;
	}

	private bool isFullHouse()
	{
		return isThreeCard && isOnePair;
	}

	private bool isStraight()
	{
		static immutable bloadway = [1, 10, 11, 12, 13];
		bool _isStraight()
		{
			bool f = true;
			for(int i = 0; i < cards.length - 1 && f; i++)
				f = cards[i + 1] - cards[i] == 1;
			return f;
		}

		return _isStraight() || cards == bloadway;
	}

	private bool isThreeCard()
	{
		return maxNumOfSameCards == 3;
	}

	private bool isTwoPair()
	{
		return numOfPairs == 2;
	}
	
	private bool isOnePair()
	{
		return numOfPairs == 1;
	}

	private int numOfPairs()
	{
		int[14] nums;
		foreach(card; cards)
			nums[card]++;

		auto cnt = 0;
		foreach(num; nums)
			if(num == 2)
				cnt++;

		return cnt;
	}

	private int maxNumOfSameCards()
	{
		int[14] nums;
		foreach(card; cards)
			nums[card]++;
		return max(nums);
	}

	private int max(int[] arr...)
	{
		int max = 0;
		foreach(v; arr)
			max = v > max ? v : max;
		return max;
	}
}