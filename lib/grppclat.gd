#############################################################################
##
##  This file is part of GAP, a system for computational discrete algebra.
##  This file's authors include Alexander Hulpke.
##
##  Copyright of GAP belongs to its developers, whose names are too numerous
##  to list here. Please refer to the COPYRIGHT file for details.
##
##  SPDX-License-Identifier: GPL-2.0-or-later
##
##  This  file contains declarations for the subgroup lattice functions for
##  pc groups.
##

#############################################################################
##
#V  InfoPcSubgroup
##
##  <#GAPDoc Label="InfoPcSubgroup">
##  <ManSection>
##  <InfoClass Name="InfoPcSubgroup"/>
##
##  <Description>
##  Information function for the subgroup lattice functions using pcgs.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareInfoClass("InfoPcSubgroup");

#############################################################################
##
#O  InvariantElementaryAbelianSeries( <G>, <morph>[, <N> [, <fine>]] )
##
##  <#GAPDoc Label="InvariantElementaryAbelianSeries">
##  <ManSection>
##  <Func Name="InvariantElementaryAbelianSeries" Arg='G, morph[, N [, fine]]'/>
##
##  <Description>
##  For a (solvable) group <A>G</A> and a list of automorphisms <A>morph</A>
##  of <A>G</A>, this command finds a normal series of <A>G</A> with
##  elementary abelian factors such that every group in this series is
##  invariant under every automorphism in <A>morph</A>.
##  <P/>
##  If a normal subgroup <A>N</A> of <A>G</A> which is invariant under
##  <A>morph</A> is given, this series is chosen to contain <A>N</A>.
##  No tests are performed to check the validity of the arguments.
##  <P/>
##  The series obtained will be constructed to prefer large steps unless
##  <A>fine</A> is given as <K>true</K>.
##  <Example><![CDATA[
##  gap> g:=Group((1,2,3,4),(1,3));
##  Group([ (1,2,3,4), (1,3) ])
##  gap> hom:=GroupHomomorphismByImages(g,g,GeneratorsOfGroup(g),
##  > [(1,4,3,2),(1,4)(2,3)]);
##  [ (1,2,3,4), (1,3) ] -> [ (1,4,3,2), (1,4)(2,3) ]
##  gap> InvariantElementaryAbelianSeries(g,[hom]);
##  [ Group([ (1,2,3,4), (1,3) ]), Group([ (1,3)(2,4) ]), Group(()) ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction("InvariantElementaryAbelianSeries");

#############################################################################
##
#O  InducedAutomorphism( <epi>, <aut> )
##
##  <#GAPDoc Label="InducedAutomorphism">
##  <ManSection>
##  <Func Name="InducedAutomorphism" Arg='epi, aut'/>
##
##  <Description>
##  Let <A>aut</A> be an automorphism of a group <M>G</M> and <A>epi</A> be
##  a homomorphism from <M>G</M> to a group <M>H</M> such that the kernel of
##  <A>epi</A> is fixed under <A>aut</A>.
##  Let <M>U</M> be the image of <A>epi</A>.
##  This command returns the automorphism of <M>U</M> induced by <A>aut</A>
##  via <A>epi</A>, that is, the automorphism of <M>U</M> which maps
##  <M>g</M><C>^<A>epi</A></C> to
##  <C>(</C><M>g</M><C>^<A>aut</A>)^<A>epi</A></C>, for <M>g \in G</M>.
##  <Example><![CDATA[
##  gap> g:=Group((1,2,3,4),(1,2));
##  Group([ (1,2,3,4), (1,2) ])
##  gap> n:=Subgroup(g,[(1,2)(3,4),(1,3)(2,4)]);
##  Group([ (1,2)(3,4), (1,3)(2,4) ])
##  gap> epi:=NaturalHomomorphismByNormalSubgroup(g,n);
##  [ (1,2,3,4), (1,2) ] -> [ f1*f2, f1 ]
##  gap> aut:=InnerAutomorphism(g,(1,2,3));
##  ^(1,2,3)
##  gap> InducedAutomorphism(epi,aut);
##  ^f2
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction("InducedAutomorphism");

#############################################################################
##
#F  InvariantSubgroupsElementaryAbelianGroup(<G>,<homs>[,<dims>])  submodules
##
##  <#GAPDoc Label="InvariantSubgroupsElementaryAbelianGroup">
##  <ManSection>
##  <Func Name="InvariantSubgroupsElementaryAbelianGroup"
##   Arg='G, homs[, dims]'/>
##
##  <Description>
##  Let <A>G</A> be an elementary abelian group
##  and <A>homs</A> be a set of automorphisms of <A>G</A>.
##  Then this function computes all subspaces of
##  <A>G</A> which are invariant under all automorphisms in <A>homs</A>.
##  When considering <A>G</A> as a module for the algebra generated by
##  <A>homs</A>, these are all submodules.
##  If <A>homs</A> is empty, it computes all subgroups. 
##  If the optional parameter <A>dims</A> is given, only submodules of this
##  dimension are computed.
##  <Example><![CDATA[
##  gap> g:=Group((1,2,3),(4,5,6),(7,8,9));
##  Group([ (1,2,3), (4,5,6), (7,8,9) ])
##  gap> hom:=GroupHomomorphismByImages(g,g,[(1,2,3),(4,5,6),(7,8,9)],
##  > [(7,8,9),(1,2,3),(4,5,6)]);
##  [ (1,2,3), (4,5,6), (7,8,9) ] -> [ (7,8,9), (1,2,3), (4,5,6) ]
##  gap> u:=InvariantSubgroupsElementaryAbelianGroup(g,[hom]);
##  [ Group(()), Group([ (1,2,3)(4,5,6)(7,8,9) ]), 
##    Group([ (1,3,2)(7,8,9), (1,3,2)(4,5,6) ]), 
##    Group([ (7,8,9), (4,5,6), (1,2,3) ]) ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction(
    "InvariantSubgroupsElementaryAbelianGroup");

#############################################################################
##
#F  ActionSubspacesElementaryAbelianGroup(<P>,<G>[,<dims>])  submodules
##
##  <ManSection>
##  <Func Name="ActionSubspacesElementaryAbelianGroup" Arg='P, G[, dims]'/>
##
##  <Description>
##  computes the permutation action of <A>P</A> on the subspaces of the
##  elementary abelian subgroup <A>G</A> of <A>P</A>. Returns
##  a list [<A>subspaces</A>,<A>action</A>], where <A>subspaces</A> is a list of all the
##  subspaces and <A>action</A> a homomorphism from <A>P</A> in a permutation group,
##  which is equal to the action homomrophism for the action of <A>P</A> on
##  <A>subspaces</A>. If <A>dims</A> is given, only subspaces of dimension <A>dims</A> are
##  considered.
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction(
    "ActionSubspacesElementaryAbelianGroup");

#############################################################################
##
#F  SubgroupsSolvableGroup(<G>[,<opt>]) . classreps of subgrps of <G>,
##
##  <#GAPDoc Label="SubgroupsSolvableGroup">
##  <ManSection>
##  <Func Name="SubgroupsSolvableGroup" Arg='G[, opt]'/>
##
##  <Description>
##  This function (implementing the algorithm published in
##  <Cite Key="Hulpke99"/>) computes subgroups of a solvable group <A>G</A>,
##  using the homomorphism principle.
##  It returns a list of representatives up to <A>G</A>-conjugacy.
##  <P/>
##  The optional argument <A>opt</A> is a record, which may
##  be used to suggest restrictions on the subgroups computed.
##  The following record
##  components of <A>opt</A> are recognized and have the following effects.
##  Note that all of the following
##  restrictions to subgroups with particular properties are
##  only used to speed up the calculation, but the result might still contain
##  subgroups (that had to be computed in any case) that do not satisfy the
##  properties. If this is not desired, the calculation must be followed by an
##  explicit test for the desired properties (which is not done by default, as
##  it would be a general slowdown).
##  The function guarantees that representatives of all subgroups that
##  satisfy the properties are found, i.e. there can be only false positives.
##  <List>
##  <Mark><C>actions</C></Mark>
##  <Item>
##  must be a list of automorphisms of <A>G</A>. If given, only groups
##  which are invariant under all these automorphisms are computed. The
##  algorithm must know the normalizer in <A>G</A> of the group generated by
##  <C>actions</C> (defined formally by embedding in the semidirect product of
##  <A>G</A> with <A>actions</A>).
##  This can be given in the component <C>funcnorm</C> and
##  will be computed if this component is not given.
##  </Item>
##  <Mark><C>normal</C></Mark>
##  <Item>
##  if set to <K>true</K> only normal subgroups are guaranteed to be
##  returned (though some of the returned subgroups might still be not
##  normal).
##  </Item>
##  <Mark><C>consider</C></Mark>
##  <Item>
##  a function to restrict the groups computed. This must be a
##  function of five parameters, <M>C</M>, <M>A</M>, <M>N</M>, <M>B</M>,
##  <M>M</M>, that are interpreted as follows:
##  The arguments are subgroups of a factor <M>F</M> of <A>G</A> in the
##  relation <M>F \geq C > A > N > B > M</M>.
##  <M>N</M> and <M>M</M> are normal subgroups.
##  <M>C</M> is the full preimage of the normalizer of <M>A/N</M>
##  in <M>F/N</M>.
##  When computing modulo <M>M</M> and looking for subgroups <M>U</M> such
##  that <M>U \cap N = B</M> and <M>\langle U, N \rangle = A</M>,
##  this function is called.
##  If it returns <K>false</K> then
##  all potential groups <M>U</M> (and therefore all groups later arising
##  from them) are disregarded. This can be used for example to compute only
##  subgroups of certain sizes. 
##  <P/>
##  (<E>This is just a restriction to speed up computations. The function may
##  still return (invariant) subgroups which don't fulfill this condition!</E>)
##  This parameter is used to permit calculations of some subgroups if the
##  set of all subgroups would be too large to handle.
##  <P/>
##  The actual groups <M>C</M>, <M>A</M>, <M>N</M> and <M>B</M> which are
##  passed to this function are not necessarily subgroups of <A>G</A>
##  but might be subgroups of a proper factor group <M>F = <A>G</A>/H</M>.
##  Therefore the <C>consider</C> function may
##  not relate the parameter groups to <A>G</A>.
##  </Item>
##  <Mark><C>retnorm</C></Mark>
##  <Item>
##  if set to <K>true</K> the function not only returns a list <C>subs</C>
##  of subgroups but also a corresponding list <C>norms</C> of normalizers
##  in the form <C>[ subs, norms ]</C>.
##  </Item>
##  <Mark><C>series</C></Mark>
##  <Item>
##  is an elementary abelian series of <A>G</A> which will be used for
##  the computation.
##  </Item>
##  <Mark><C>groups</C></Mark>
##  <Item>
##  is a list of groups to seed the calculation. Only subgroups of
##  these groups are constructed.
##  </Item>
##  </List>
##  <Example><![CDATA[
##  gap> g:=Group((1,2,3),(1,2),(4,5,6),(4,5),(7,8,9),(7,8));
##  Group([ (1,2,3), (1,2), (4,5,6), (4,5), (7,8,9), (7,8) ])
##  gap> hom:=GroupHomomorphismByImages(g,g,
##  > [(1,2,3),(1,2),(4,5,6),(4,5),(7,8,9),(7,8)],
##  > [(4,5,6),(4,5),(7,8,9),(7,8),(1,2,3),(1,2)]);
##  [ (1,2,3), (1,2), (4,5,6), (4,5), (7,8,9), (7,8) ] -> 
##  [ (4,5,6), (4,5), (7,8,9), (7,8), (1,2,3), (1,2) ]
##  gap> l:=SubgroupsSolvableGroup(g,rec(actions:=[hom]));;
##  gap> List(l,Size);
##  [ 1, 3, 9, 27, 54, 2, 6, 18, 108, 4, 216, 8 ]
##  gap> Length(ConjugacyClassesSubgroups(g)); # to compare
##  162
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction("SubgroupsSolvableGroup");

#############################################################################
##
#F  SizeConsiderFunction(<size>)   returns `consider' function
##
##  <#GAPDoc Label="SizeConsiderFunction">
##  <ManSection>
##  <Func Name="SizeConsiderFunction" Arg='size'/>
##
##  <Description>
##  This function returns a function <C>consider</C> of four arguments
##  that can be used in <Ref Func="SubgroupsSolvableGroup"/> for
##  the option <C>consider</C> to compute subgroups whose sizes are divisible
##  by <A>size</A>.
##  <Example><![CDATA[
##  gap> l:=SubgroupsSolvableGroup(g,rec(actions:=[hom],
##  > consider:=SizeConsiderFunction(6)));;
##  gap> List(l,Size);
##  [ 1, 3, 9, 27, 54, 6, 18, 108, 216 ]
##  ]]></Example>
##  <P/>
##  This example shows that in general the <C>consider</C> function does not
##  provide a perfect filter.
##  It is guaranteed that all subgroups fulfilling the
##  condition are returned, but not all subgroups returned necessarily fulfill
##  the condition.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction("SizeConsiderFunction");

#############################################################################
##
#F  ExactSizeConsiderFunction(<size>)  returns `consider' function
##
##  <#GAPDoc Label="ExactSizeConsiderFunction">
##  <ManSection>
##  <Func Name="ExactSizeConsiderFunction" Arg='size'/>
##
##  <Description>
##  This function returns a function <C>consider</C> of four arguments
##  that can be used in <Ref Func="SubgroupsSolvableGroup"/> for
##  the option <C>consider</C> to compute subgroups whose sizes are exactly
##  <A>size</A>.
##  <Example><![CDATA[
##  gap> l:=SubgroupsSolvableGroup(g,rec(actions:=[hom],
##  > consider:=ExactSizeConsiderFunction(6)));;
##  gap> List(l,Size);
##  [ 1, 3, 9, 27, 54, 6, 108, 216 ]
##  ]]></Example>
##  <P/>
##  Again, the <C>consider</C> function does not provide
##  a perfect filter. It is guaranteed that all subgroups fulfilling the
##  condition are returned, but not all subgroups returned necessarily fulfill
##  the condition.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction("ExactSizeConsiderFunction");
