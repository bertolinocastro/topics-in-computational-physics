// Creating a Lattice (matrix) that holds spin configuration
function X=init_lattice(n)
   X = rand(n,n)
   X(X>.5) = 1
   X(X<=.5) = -1
endfunction

// Computes energy difference
function a=deltaE(S0,Sn,J,H)
   a = 2*S0*(H+J*Sn)
endfunction

// using periodic condition
function Sn=neighbors(lattice,i,j,n)
   li = i-1
   ri = i+1
   lj = j-1
   rj = j+1
   if i == 1 then
      li=n
   elseif i == n then
      ri=1
   end
   if j == 1 then
      lj=n
   elseif j == n then
      rj=1
   end
   Sn = lattice(li,j)+lattice(ri,j)+lattice(i,lj)+lattice(i,rj)
endfunction

// function to convert the 0..1 range to 1..n with integers
// this function also pretends to maintain equal probability for each number
function x=lattice_rng_mapping(x,n)
   // x = x*(n-1)+1
   x = ceil(x*(n))
endfunction

// Ising Simulator
function [lattice,energies,spins]=ising(n,nsteps,H,J,T)
   lattice = init_lattice(n)
   energy = 0
   energies = []
   spins = []
   spin = sum(lattice)

   for it=1:nsteps do
      i = lattice_rng_mapping(rand(1,1),n)
      j = lattice_rng_mapping(rand(1,1),n)

      // getting neighbors state regarding to periodic boundary
      Sn = neighbors(lattice,i,j,n)

      dE = deltaE(lattice(i,j), Sn, J, H)

      if dE < 0 || rand(1,1) < exp(-dE/T) then
         lattice(i,j) = -lattice(i,j)
         energy = energy + dE
         energies = [energies, energy]
         spin = spin + 2*lattice(i,j)
      end

      spins = [spins, spin]

   end

endfunction
