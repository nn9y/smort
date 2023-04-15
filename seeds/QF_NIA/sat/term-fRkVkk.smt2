(set-info :smt-lib-version 2.6)
(set-logic QF_NIA)
(set-info :source |
     Constraint systems stating that a matrix interpretation is
     compatible with a rewriting system (weakly compatible with
     all rules, strictly compatible with at least one).

     Contributed by Johannes Waldmann at HTKW Leipzig.
   |)
(set-info :category "crafted")
(set-info :status sat)
(declare-fun n0 () Int)
(assert (>= n0 0))
(declare-fun n1 () Int)
(assert (>= n1 0))
(declare-fun n2 () Int)
(assert (>= n2 0))
(declare-fun n3 () Int)
(assert (>= n3 0))
(declare-fun n4 () Int)
(assert (>= n4 0))
(declare-fun n5 () Int)
(assert (>= n5 0))
(assert (>= n2 1))
(declare-fun n6 () Int)
(assert (>= n6 0))
(declare-fun n7 () Int)
(assert (>= n7 0))
(declare-fun n8 () Int)
(assert (>= n8 0))
(declare-fun n9 () Int)
(assert (>= n9 0))
(declare-fun n10 () Int)
(assert (>= n10 0))
(declare-fun n11 () Int)
(assert (>= n11 0))
(assert (>= n8 1))
(declare-fun n12 () Int)
(assert (>= n12 0))
(declare-fun n13 () Int)
(assert (>= n13 0))
(declare-fun n14 () Int)
(assert (>= n14 0))
(declare-fun n15 () Int)
(assert (>= n15 0))
(declare-fun n16 () Int)
(assert (>= n16 0))
(declare-fun n17 () Int)
(assert (>= n17 0))
(assert (>= n14 1))
(declare-fun n18 () Int)
(assert (= n18 (* n2 n6)))
(declare-fun n19 () Int)
(assert (= n19 (* n3 n7)))
(declare-fun n20 () Int)
(assert (= n20 (* n4 n6)))
(declare-fun n21 () Int)
(assert (= n21 (* n5 n7)))
(declare-fun n22 () Int)
(assert (= n22 (+ n18 n19)))
(declare-fun n23 () Int)
(assert (= n23 (+ n20 n21)))
(declare-fun n24 () Int)
(assert (= n24 (+ n0 n22)))
(declare-fun n25 () Int)
(assert (= n25 (+ n1 n23)))
(declare-fun n26 () Int)
(assert (= n26 (* n2 n8)))
(declare-fun n27 () Int)
(assert (= n27 (* n3 n10)))
(declare-fun n28 () Int)
(assert (= n28 (* n2 n9)))
(declare-fun n29 () Int)
(assert (= n29 (* n3 n11)))
(declare-fun n30 () Int)
(assert (= n30 (* n4 n8)))
(declare-fun n31 () Int)
(assert (= n31 (* n5 n10)))
(declare-fun n32 () Int)
(assert (= n32 (* n4 n9)))
(declare-fun n33 () Int)
(assert (= n33 (* n5 n11)))
(declare-fun n34 () Int)
(assert (= n34 (+ n26 n27)))
(declare-fun n35 () Int)
(assert (= n35 (+ n28 n29)))
(declare-fun n36 () Int)
(assert (= n36 (+ n30 n31)))
(declare-fun n37 () Int)
(assert (= n37 (+ n32 n33)))
(declare-fun n38 () Int)
(assert (= n38 (* n14 n12)))
(declare-fun n39 () Int)
(assert (= n39 (* n15 n13)))
(declare-fun n40 () Int)
(assert (= n40 (* n16 n12)))
(declare-fun n41 () Int)
(assert (= n41 (* n17 n13)))
(declare-fun n42 () Int)
(assert (= n42 (+ n38 n39)))
(declare-fun n43 () Int)
(assert (= n43 (+ n40 n41)))
(declare-fun n44 () Int)
(assert (= n44 (+ n12 n42)))
(declare-fun n45 () Int)
(assert (= n45 (+ n13 n43)))
(declare-fun n46 () Int)
(assert (= n46 (* n14 n14)))
(declare-fun n47 () Int)
(assert (= n47 (* n15 n16)))
(declare-fun n48 () Int)
(assert (= n48 (* n14 n15)))
(declare-fun n49 () Int)
(assert (= n49 (* n15 n17)))
(declare-fun n50 () Int)
(assert (= n50 (* n16 n14)))
(declare-fun n51 () Int)
(assert (= n51 (* n17 n16)))
(declare-fun n52 () Int)
(assert (= n52 (* n16 n15)))
(declare-fun n53 () Int)
(assert (= n53 (* n17 n17)))
(declare-fun n54 () Int)
(assert (= n54 (+ n46 n47)))
(declare-fun n55 () Int)
(assert (= n55 (+ n48 n49)))
(declare-fun n56 () Int)
(assert (= n56 (+ n50 n51)))
(declare-fun n57 () Int)
(assert (= n57 (+ n52 n53)))
(declare-fun n58 () Int)
(assert (= n58 (* n8 n24)))
(declare-fun n59 () Int)
(assert (= n59 (* n9 n25)))
(declare-fun n60 () Int)
(assert (= n60 (* n10 n24)))
(declare-fun n61 () Int)
(assert (= n61 (* n11 n25)))
(declare-fun n62 () Int)
(assert (= n62 (+ n58 n59)))
(declare-fun n63 () Int)
(assert (= n63 (+ n60 n61)))
(declare-fun n64 () Int)
(assert (= n64 (+ n6 n62)))
(declare-fun n65 () Int)
(assert (= n65 (+ n7 n63)))
(declare-fun n66 () Int)
(assert (= n66 (* n8 n34)))
(declare-fun n67 () Int)
(assert (= n67 (* n9 n36)))
(declare-fun n68 () Int)
(assert (= n68 (* n8 n35)))
(declare-fun n69 () Int)
(assert (= n69 (* n9 n37)))
(declare-fun n70 () Int)
(assert (= n70 (* n10 n34)))
(declare-fun n71 () Int)
(assert (= n71 (* n11 n36)))
(declare-fun n72 () Int)
(assert (= n72 (* n10 n35)))
(declare-fun n73 () Int)
(assert (= n73 (* n11 n37)))
(declare-fun n74 () Int)
(assert (= n74 (+ n66 n67)))
(declare-fun n75 () Int)
(assert (= n75 (+ n68 n69)))
(declare-fun n76 () Int)
(assert (= n76 (+ n70 n71)))
(declare-fun n77 () Int)
(assert (= n77 (+ n72 n73)))
(declare-fun n78 () Int)
(assert (= n78 (* n8 n44)))
(declare-fun n79 () Int)
(assert (= n79 (* n9 n45)))
(declare-fun n80 () Int)
(assert (= n80 (* n10 n44)))
(declare-fun n81 () Int)
(assert (= n81 (* n11 n45)))
(declare-fun n82 () Int)
(assert (= n82 (+ n78 n79)))
(declare-fun n83 () Int)
(assert (= n83 (+ n80 n81)))
(declare-fun n84 () Int)
(assert (= n84 (+ n6 n82)))
(declare-fun n85 () Int)
(assert (= n85 (+ n7 n83)))
(declare-fun n86 () Int)
(assert (= n86 (* n8 n54)))
(declare-fun n87 () Int)
(assert (= n87 (* n9 n56)))
(declare-fun n88 () Int)
(assert (= n88 (* n8 n55)))
(declare-fun n89 () Int)
(assert (= n89 (* n9 n57)))
(declare-fun n90 () Int)
(assert (= n90 (* n10 n54)))
(declare-fun n91 () Int)
(assert (= n91 (* n11 n56)))
(declare-fun n92 () Int)
(assert (= n92 (* n10 n55)))
(declare-fun n93 () Int)
(assert (= n93 (* n11 n57)))
(declare-fun n94 () Int)
(assert (= n94 (+ n86 n87)))
(declare-fun n95 () Int)
(assert (= n95 (+ n88 n89)))
(declare-fun n96 () Int)
(assert (= n96 (+ n90 n91)))
(declare-fun n97 () Int)
(assert (= n97 (+ n92 n93)))
(declare-fun n98 () Int)
(assert (= n98 (* n34 n84)))
(declare-fun n99 () Int)
(assert (= n99 (* n35 n85)))
(declare-fun n100 () Int)
(assert (= n100 (* n36 n84)))
(declare-fun n101 () Int)
(assert (= n101 (* n37 n85)))
(declare-fun n102 () Int)
(assert (= n102 (+ n98 n99)))
(declare-fun n103 () Int)
(assert (= n103 (+ n100 n101)))
(declare-fun n104 () Int)
(assert (= n104 (+ n24 n102)))
(declare-fun n105 () Int)
(assert (= n105 (+ n25 n103)))
(declare-fun n106 () Int)
(assert (= n106 (* n34 n94)))
(declare-fun n107 () Int)
(assert (= n107 (* n35 n96)))
(declare-fun n108 () Int)
(assert (= n108 (* n34 n95)))
(declare-fun n109 () Int)
(assert (= n109 (* n35 n97)))
(declare-fun n110 () Int)
(assert (= n110 (* n36 n94)))
(declare-fun n111 () Int)
(assert (= n111 (* n37 n96)))
(declare-fun n112 () Int)
(assert (= n112 (* n36 n95)))
(declare-fun n113 () Int)
(assert (= n113 (* n37 n97)))
(declare-fun n114 () Int)
(assert (= n114 (+ n106 n107)))
(declare-fun n115 () Int)
(assert (= n115 (+ n108 n109)))
(declare-fun n116 () Int)
(assert (= n116 (+ n110 n111)))
(declare-fun n117 () Int)
(assert (= n117 (+ n112 n113)))
(declare-fun n118 () Int)
(assert (= n118 (* n74 n44)))
(declare-fun n119 () Int)
(assert (= n119 (* n75 n45)))
(declare-fun n120 () Int)
(assert (= n120 (* n76 n44)))
(declare-fun n121 () Int)
(assert (= n121 (* n77 n45)))
(declare-fun n122 () Int)
(assert (= n122 (+ n118 n119)))
(declare-fun n123 () Int)
(assert (= n123 (+ n120 n121)))
(declare-fun n124 () Int)
(assert (= n124 (+ n64 n122)))
(declare-fun n125 () Int)
(assert (= n125 (+ n65 n123)))
(declare-fun n126 () Int)
(assert (= n126 (* n74 n54)))
(declare-fun n127 () Int)
(assert (= n127 (* n75 n56)))
(declare-fun n128 () Int)
(assert (= n128 (* n74 n55)))
(declare-fun n129 () Int)
(assert (= n129 (* n75 n57)))
(declare-fun n130 () Int)
(assert (= n130 (* n76 n54)))
(declare-fun n131 () Int)
(assert (= n131 (* n77 n56)))
(declare-fun n132 () Int)
(assert (= n132 (* n76 n55)))
(declare-fun n133 () Int)
(assert (= n133 (* n77 n57)))
(declare-fun n134 () Int)
(assert (= n134 (+ n126 n127)))
(declare-fun n135 () Int)
(assert (= n135 (+ n128 n129)))
(declare-fun n136 () Int)
(assert (= n136 (+ n130 n131)))
(declare-fun n137 () Int)
(assert (= n137 (+ n132 n133)))
(declare-fun n138 () Int)
(assert (= n138 (* n114 n6)))
(declare-fun n139 () Int)
(assert (= n139 (* n115 n7)))
(declare-fun n140 () Int)
(assert (= n140 (* n116 n6)))
(declare-fun n141 () Int)
(assert (= n141 (* n117 n7)))
(declare-fun n142 () Int)
(assert (= n142 (+ n138 n139)))
(declare-fun n143 () Int)
(assert (= n143 (+ n140 n141)))
(declare-fun n144 () Int)
(assert (= n144 (+ n104 n142)))
(declare-fun n145 () Int)
(assert (= n145 (+ n105 n143)))
(declare-fun n146 () Int)
(assert (= n146 (* n114 n8)))
(declare-fun n147 () Int)
(assert (= n147 (* n115 n10)))
(declare-fun n148 () Int)
(assert (= n148 (* n114 n9)))
(declare-fun n149 () Int)
(assert (= n149 (* n115 n11)))
(declare-fun n150 () Int)
(assert (= n150 (* n116 n8)))
(declare-fun n151 () Int)
(assert (= n151 (* n117 n10)))
(declare-fun n152 () Int)
(assert (= n152 (* n116 n9)))
(declare-fun n153 () Int)
(assert (= n153 (* n117 n11)))
(declare-fun n154 () Int)
(assert (= n154 (+ n146 n147)))
(declare-fun n155 () Int)
(assert (= n155 (+ n148 n149)))
(declare-fun n156 () Int)
(assert (= n156 (+ n150 n151)))
(declare-fun n157 () Int)
(assert (= n157 (+ n152 n153)))
(declare-fun n158 () Int)
(assert (= n158 (* n134 n6)))
(declare-fun n159 () Int)
(assert (= n159 (* n135 n7)))
(declare-fun n160 () Int)
(assert (= n160 (* n136 n6)))
(declare-fun n161 () Int)
(assert (= n161 (* n137 n7)))
(declare-fun n162 () Int)
(assert (= n162 (+ n158 n159)))
(declare-fun n163 () Int)
(assert (= n163 (+ n160 n161)))
(declare-fun n164 () Int)
(assert (= n164 (+ n124 n162)))
(declare-fun n165 () Int)
(assert (= n165 (+ n125 n163)))
(declare-fun n166 () Int)
(assert (= n166 (* n134 n8)))
(declare-fun n167 () Int)
(assert (= n167 (* n135 n10)))
(declare-fun n168 () Int)
(assert (= n168 (* n134 n9)))
(declare-fun n169 () Int)
(assert (= n169 (* n135 n11)))
(declare-fun n170 () Int)
(assert (= n170 (* n136 n8)))
(declare-fun n171 () Int)
(assert (= n171 (* n137 n10)))
(declare-fun n172 () Int)
(assert (= n172 (* n136 n9)))
(declare-fun n173 () Int)
(assert (= n173 (* n137 n11)))
(declare-fun n174 () Int)
(assert (= n174 (+ n166 n167)))
(declare-fun n175 () Int)
(assert (= n175 (+ n168 n169)))
(declare-fun n176 () Int)
(assert (= n176 (+ n170 n171)))
(declare-fun n177 () Int)
(assert (= n177 (+ n172 n173)))
(declare-fun n178 () Int)
(assert (= n178 (* n154 n0)))
(declare-fun n179 () Int)
(assert (= n179 (* n155 n1)))
(declare-fun n180 () Int)
(assert (= n180 (* n156 n0)))
(declare-fun n181 () Int)
(assert (= n181 (* n157 n1)))
(declare-fun n182 () Int)
(assert (= n182 (+ n178 n179)))
(declare-fun n183 () Int)
(assert (= n183 (+ n180 n181)))
(declare-fun n184 () Int)
(assert (= n184 (+ n144 n182)))
(declare-fun n185 () Int)
(assert (= n185 (+ n145 n183)))
(declare-fun n186 () Int)
(assert (= n186 (* n154 n2)))
(declare-fun n187 () Int)
(assert (= n187 (* n155 n4)))
(declare-fun n188 () Int)
(assert (= n188 (* n154 n3)))
(declare-fun n189 () Int)
(assert (= n189 (* n155 n5)))
(declare-fun n190 () Int)
(assert (= n190 (* n156 n2)))
(declare-fun n191 () Int)
(assert (= n191 (* n157 n4)))
(declare-fun n192 () Int)
(assert (= n192 (* n156 n3)))
(declare-fun n193 () Int)
(assert (= n193 (* n157 n5)))
(declare-fun n194 () Int)
(assert (= n194 (+ n186 n187)))
(declare-fun n195 () Int)
(assert (= n195 (+ n188 n189)))
(declare-fun n196 () Int)
(assert (= n196 (+ n190 n191)))
(declare-fun n197 () Int)
(assert (= n197 (+ n192 n193)))
(assert (>= n164 n184))
(assert (>= n165 n185))
(assert (>= n174 n194))
(assert (>= n175 n195))
(assert (>= n176 n196))
(assert (>= n177 n197))
(assert (> n164 n184))
(check-sat)
(exit)