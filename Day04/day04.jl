function day04(file)
    numwinners = [begin
        splitcard = match(r"Card *\d+: (.*) \| (.*)",line).captures;
        winnings,haves = [parse.(Int,split(cardside)) for cardside in splitcard];
        wins = length(intersect(winnings,haves));
        end
        for line in eachline(file)];
    # For part 2, count starting from final card how many cards each card is worth, given the number of winners
    ncards = length(numwinners);
    num_cards_produced = ones(ncards); # in any case each card counts as one card
    for i in ncards:-1:1
        for j = 1:numwinners[i]
            if i+j<=ncards
                num_cards_produced[i] += num_cards_produced[i+j];
            end
        end
    end
    return sum(2^(n-1) for n in numwinners if n>0),sum(num_cards_produced)
end