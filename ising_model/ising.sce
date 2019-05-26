// importing all codes
exec('ising.sci');

// running simulation for temperatures
temperatures = [.5, 2.27, 5.]
styles = ['b-', 'r-', 'g-']

for i=1:length(temperatures) do
   T = temperatures(i)

   // [lattice, energies, spins] = ising(n=200, nsteps=500000, H=0, J=1, T=1)
   [lattice, energies, spins] = ising(n=200, nsteps=50000, H=0, J=1, T=T)
   spins = spins ./ 200^2 // taking average spin per site

   plot(1:length(spins),spins,styles(i))
end

legend(string(temperatures))
