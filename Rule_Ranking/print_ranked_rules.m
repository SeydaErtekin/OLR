% Script to display the ordered list of rules after ranking.
% Here we read in the rules (in the original order) and the
% ranking output. 

clear all;

dataset_name = 'haberman_binary';
split = '12';
suffix = '1div4_C1_1divR_';

haberman_rule_names = {'age<40', ...
		       'age40-49', ...
		       'age50-59', ...
		       'age60-69', ...
		       'age>69', ...
		       'year<60', ...
		       'year60-61', ...
		       'year62-63', ...
		       'year64-65', ...
		       'year>65', ...
		       'nodes0', ...
		       'nodes1-9', ...
		       'nodes10-19', ...
		       'nodes20-29', ...
		       'nodes>29'};

tictactoe_rule_names = {'x1', ...
			'o1', ...
			'b1', ...
			'x2', ...
			'o2', ...
			'b2', ...
			'x3', ...
			'o3', ...
			'b3', ...
			'x4', ...
			'o4', ...
			'b4', ...
			'x5', ...
			'o5', ...
			'b5', ...
			'x6', ...
			'o6', ...
			'b6', ...
			'x7', ...
			'o7', ...
			'b7', ...
			'x8', ...
			'o8', ...
			'b8', ...
			'x9', ...
			'o9', ...
			'b9'};

rule_names = haberman_rule_names;

% Load rules in original order
Rules = load(sprintf('../Rule_Generation/rules/%s_train12_rules_all.txt', dataset_name));

% Load rule ranks
RuleRanks = load(sprintf('rules/%s_train12_rank_output_%s.dat', dataset_name, suffix));

% Reorder the rules according to the computed ranks.
[val,ind] = sort(RuleRanks, 'descend');
Rules = Rules(ind,:);

Rules_X = Rules(:,1:end-1);
Rules_Y = Rules(:,end);

rule_sizes = sum(Rules_X');

size(Rules_X,1);
sprintf('Num Features: %g', size(Rules_X,2));
default_rule_ind = find(rule_sizes == 0);

for i=1:default_rule_ind(1)
  ind = find(Rules_X(i,:) == 1);
  str = sprintf('%s ', rule_names{ind})
  Rules_Y(i)
end
