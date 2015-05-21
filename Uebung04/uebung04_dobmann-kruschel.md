# Künstliche Intelligenz - Übung 4
### Julian Dobmann, Kai Kruschel


## Aufgabe 2
*"To prove logical consequence take the axioms and negated conjecture in CNF, and check for unsatisfiability."*

Vermutung/Conjecture: I always avoid a kangaroo.

Negierte Vermutung:

	cnf(avoid_kangaroo,negated_conjecture,
    	( ~ avoided(the_kangaroo) )).

Von dieser (negierten) Vermutung ist die Unerfüllbarkeit zu zeigen.

#### DPLL-Algo
*Quelle: [http://www.cs.miami.edu/~geoff/Courses/CSC648-12S/Content/DPLL.shtml](http://www.cs.miami.edu/~geoff/Courses/CSC648-12S/Content/DPLL.shtml)*

Mit römischen Ziffern sind "Breakpoints" im Algorithmus markiert.

	def dpll(S)
		# I
		if (S is empty)
			return "satisfiable"
		end
		
		# II
		while (there is some *unit clause* {p} or some pure literal p)
			# III
			if ({p} and {~p} are in S)
				return "unsatisfiable"
			else
				S = simplify(S,p)
			end
		end
		
		# IV
		if (S is empty)
			return "satisfiable"
		end
		
		# V
		# pick some literal q from a shortest clause in S
		q = pick(S)
		
		# VI
		if (dpll(simplify(S,q)) == "satisfiable")
			return "satisfiable"
		else
			return dpll(simplify(S,~q))
		end
	end
	
	
	def simplify(S, p)
		delete every clause in S containing p
		delete every occurence in S of ~p
		return S
	end

Anwendung des DPLL-Algorithmus: ```dpll(S)```.

	S = {
	  ~ in_house(Cat) | cat(Cat),
	  ~ gazer(Gazer) | suitable_pet(Gazer),
	  ~ detested(Detested) | avoided(Detested),
	  ~ carnivore(Carnivore) | prowler(Carnivore),
	  ~ cat(Cat) | mouse_killer(Cat),
	  ~ take_to_me(Taken_animal) | in_house(Taken_animal),
	  ~ kangaroo(Kangaroo) | ~ suitable_pet(Kangaroo),
	  ~ mouse_killer(Killer) | carnivore(Killer),
	  takes_to_me(Animal) | detested(Animal),
	  ~ prowler(Prowler) | gazer(Prowler),
	  kangaroo(the_kangaroo),
	  ~ avoided(the_kangaroo)
	}
	@I: S is not empty
	@II: S contains a unit clause: kangaroo(the_kangaroo)
	@III: ~ kangaroo(the_kangaroo) is not in S
		->  S = simplify(S, kangaroo(the_kangaroo))
			S = {
              ~ in_house(Cat) | cat(Cat),
              ~ gazer(Gazer) | suitable_pet(Gazer),
              ~ detested(Detested) | avoided(Detested),
              ~ carnivore(Carnivore) | prowler(Carnivore),
              ~ cat(Cat) | mouse_killer(Cat),
              ~ take_to_me(Taken_animal) | in_house(Taken_animal),
              ~ suitable_pet(Kangaroo),
              ~ mouse_killer(Killer) | carnivore(Killer),
              takes_to_me(Animal) | detested(Animal),
              ~ prowler(Prowler) | gazer(Prowler),
              ~ avoided(the_kangaroo)
			}
	@II: S contains a unit clause: ~ avoided(the_kangaroo)
	@III: avoided(the_kangaroo) is not in S
		->  S = simplify(S, ~ avoided(the_kangaroo))
			S = {
              ~ in_house(Cat) | cat(Cat),
              ~ gazer(Gazer) | suitable_pet(Gazer),
              ~ detested(Detested),
              ~ carnivore(Carnivore) | prowler(Carnivore),
              ~ cat(Cat) | mouse_killer(Cat),
              ~ take_to_me(Taken_animal) | in_house(Taken_animal),
              ~ suitable_pet(Kangaroo),
              ~ mouse_killer(Killer) | carnivore(Killer),
              takes_to_me(Animal) | detested(Animal),
              ~ prowler(Prowler) | gazer(Prowler)
			}
	@II: S contains a unit clause: ~ suitable_pet(Kangaroo)
	@III: suitable_pet(Kangaroo) is not in S
		->  S = simplify(S, ~ suitable_pet(Kangaroo))
			S = {
              ~ in_house(Cat) | cat(Cat),
              ~ gazer(Gazer),
              ~ detested(Detested),
              ~ carnivore(Carnivore) | prowler(Carnivore),
              ~ cat(Cat) | mouse_killer(Cat),
              ~ take_to_me(Taken_animal) | in_house(Taken_animal),
              ~ mouse_killer(Killer) | carnivore(Killer),
              takes_to_me(Animal) | detested(Animal),
              ~ prowler(Prowler) | gazer(Prowler)
			}
	@II: S contains a unit clause: ~ gazer(Gazer)
	@III: gazer(Gazer) is not in S
		->  S = simplify(S, ~ gazer(Gazer))
			S = {
              ~ in_house(Cat) | cat(Cat),
              ~ detested(Detested),
              ~ carnivore(Carnivore) | prowler(Carnivore),
              ~ cat(Cat) | mouse_killer(Cat),
              ~ take_to_me(Taken_animal) | in_house(Taken_animal),
              ~ mouse_killer(Killer) | carnivore(Killer),
              takes_to_me(Animal) | detested(Animal),
              ~ prowler(Prowler)
			}
	@II: S contains a unit clause: ~ detested(Detested)
	@III: detested(Detested) is not in S
		->  S = simplify(S, ~ detested(Detested))
			S = {
              ~ in_house(Cat) | cat(Cat),
              ~ carnivore(Carnivore) | prowler(Carnivore),
              ~ cat(Cat) | mouse_killer(Cat),
              ~ take_to_me(Taken_animal) | in_house(Taken_animal),
              ~ mouse_killer(Killer) | carnivore(Killer),
              takes_to_me(Animal),
              ~ prowler(Prowler)
			}
	@II: S contains a unit clause: ~ prowler(Prowler)
	@III: prowler(Prowler) is not in S
		->  S = simplify(S, ~ prowler(Prowler))
			S = {
              ~ in_house(Cat) | cat(Cat),
              ~ carnivore(Carnivore),
              ~ cat(Cat) | mouse_killer(Cat),
              ~ take_to_me(Taken_animal) | in_house(Taken_animal),
              ~ mouse_killer(Killer) | carnivore(Killer),
              takes_to_me(Animal)
			}
	@II: S contains a unit clause: ~ carnivore(Carnivore)
	@III: carnivore(Carnivore) is not in S
		->  S = simplify(S, ~ carnivore(Carnivore))
			S = {
              ~ in_house(Cat) | cat(Cat),
              ~ cat(Cat) | mouse_killer(Cat),
              ~ take_to_me(Taken_animal) | in_house(Taken_animal),
              ~ mouse_killer(Killer),
              takes_to_me(Animal)
			}
	@II: S contains a unit clause: ~ mouse_killer(Killer)
	@III: mouse_killer(Killer) is not in S
		->  S = simplify(S, ~ mouse_killer(Killer))
			S = {
              ~ in_house(Cat) | cat(Cat),
              ~ cat(Cat),
              ~ take_to_me(Taken_animal) | in_house(Taken_animal),
              takes_to_me(Animal)
			}
	@II: S contains a unit clause: ~ cat(Cat)
	@III: cat(Cat) is not in S
		->  S = simplify(S, ~ cat(Cat))
			S = {
              ~ in_house(Cat),
              ~ take_to_me(Taken_animal) | in_house(Taken_animal),
              takes_to_me(Animal)
			}
	@II: S contains a unit clause: ~ in_house(Cat)
	@III: in_house(Cat) is not in S
		->  S = simplify(S, ~ in_house(Cat))
			S = {
              ~ take_to_me(Taken_animal),
              takes_to_me(Animal)
			}
	@II: S contains a unit clause: ~ take_to_me(Taken_animal)
	@III: take_to_me(Taken_animal) is in S
		->  return "unsatisfiable"

Das Ergebnis "unsatisfiable" bedeutet, dass die ursprüngliche (nicht negierte) Vermutung erfüllbar ist, also eine logische Konsequenz aus den Axiomen ist.