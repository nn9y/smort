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
(declare-fun n18 () Int)
(assert (>= n18 0))
(declare-fun n19 () Int)
(assert (>= n19 0))
(declare-fun n20 () Int)
(assert (>= n20 0))
(declare-fun n21 () Int)
(assert (>= n21 0))
(declare-fun n22 () Int)
(assert (>= n22 0))
(declare-fun n23 () Int)
(assert (>= n23 0))
(declare-fun n24 () Int)
(assert (>= n24 0))
(declare-fun n25 () Int)
(assert (>= n25 0))
(declare-fun n26 () Int)
(assert (>= n26 0))
(declare-fun n27 () Int)
(assert (= n27 (* n11 n15)))
(declare-fun n28 () Int)
(assert (= n28 (* n12 n16)))
(declare-fun n29 () Int)
(assert (= n29 (* n13 n15)))
(declare-fun n30 () Int)
(assert (= n30 (* n14 n16)))
(declare-fun n31 () Int)
(assert (= n31 (+ n27 n28)))
(declare-fun n32 () Int)
(assert (= n32 (+ n29 n30)))
(declare-fun n33 () Int)
(assert (= n33 (+ n9 n31)))
(declare-fun n34 () Int)
(assert (= n34 (+ n10 n32)))
(declare-fun n35 () Int)
(assert (= n35 (* n11 n17)))
(declare-fun n36 () Int)
(assert (= n36 (* n12 n19)))
(declare-fun n37 () Int)
(assert (= n37 (* n11 n18)))
(declare-fun n38 () Int)
(assert (= n38 (* n12 n20)))
(declare-fun n39 () Int)
(assert (= n39 (* n13 n17)))
(declare-fun n40 () Int)
(assert (= n40 (* n14 n19)))
(declare-fun n41 () Int)
(assert (= n41 (* n13 n18)))
(declare-fun n42 () Int)
(assert (= n42 (* n14 n20)))
(declare-fun n43 () Int)
(assert (= n43 (+ n35 n36)))
(declare-fun n44 () Int)
(assert (= n44 (+ n37 n38)))
(declare-fun n45 () Int)
(assert (= n45 (+ n39 n40)))
(declare-fun n46 () Int)
(assert (= n46 (+ n41 n42)))
(declare-fun n47 () Int)
(assert (= n47 (* n11 n9)))
(declare-fun n48 () Int)
(assert (= n48 (* n12 n10)))
(declare-fun n49 () Int)
(assert (= n49 (* n13 n9)))
(declare-fun n50 () Int)
(assert (= n50 (* n14 n10)))
(declare-fun n51 () Int)
(assert (= n51 (+ n47 n48)))
(declare-fun n52 () Int)
(assert (= n52 (+ n49 n50)))
(declare-fun n53 () Int)
(assert (= n53 (+ n9 n51)))
(declare-fun n54 () Int)
(assert (= n54 (+ n10 n52)))
(declare-fun n55 () Int)
(assert (= n55 (* n11 n11)))
(declare-fun n56 () Int)
(assert (= n56 (* n12 n13)))
(declare-fun n57 () Int)
(assert (= n57 (* n11 n12)))
(declare-fun n58 () Int)
(assert (= n58 (* n12 n14)))
(declare-fun n59 () Int)
(assert (= n59 (* n13 n11)))
(declare-fun n60 () Int)
(assert (= n60 (* n14 n13)))
(declare-fun n61 () Int)
(assert (= n61 (* n13 n12)))
(declare-fun n62 () Int)
(assert (= n62 (* n14 n14)))
(declare-fun n63 () Int)
(assert (= n63 (+ n55 n56)))
(declare-fun n64 () Int)
(assert (= n64 (+ n57 n58)))
(declare-fun n65 () Int)
(assert (= n65 (+ n59 n60)))
(declare-fun n66 () Int)
(assert (= n66 (+ n61 n62)))
(declare-fun n67 () Int)
(assert (= n67 (* n17 n33)))
(declare-fun n68 () Int)
(assert (= n68 (* n18 n34)))
(declare-fun n69 () Int)
(assert (= n69 (* n19 n33)))
(declare-fun n70 () Int)
(assert (= n70 (* n20 n34)))
(declare-fun n71 () Int)
(assert (= n71 (+ n67 n68)))
(declare-fun n72 () Int)
(assert (= n72 (+ n69 n70)))
(declare-fun n73 () Int)
(assert (= n73 (+ n15 n71)))
(declare-fun n74 () Int)
(assert (= n74 (+ n16 n72)))
(declare-fun n75 () Int)
(assert (= n75 (* n17 n43)))
(declare-fun n76 () Int)
(assert (= n76 (* n18 n45)))
(declare-fun n77 () Int)
(assert (= n77 (* n17 n44)))
(declare-fun n78 () Int)
(assert (= n78 (* n18 n46)))
(declare-fun n79 () Int)
(assert (= n79 (* n19 n43)))
(declare-fun n80 () Int)
(assert (= n80 (* n20 n45)))
(declare-fun n81 () Int)
(assert (= n81 (* n19 n44)))
(declare-fun n82 () Int)
(assert (= n82 (* n20 n46)))
(declare-fun n83 () Int)
(assert (= n83 (+ n75 n76)))
(declare-fun n84 () Int)
(assert (= n84 (+ n77 n78)))
(declare-fun n85 () Int)
(assert (= n85 (+ n79 n80)))
(declare-fun n86 () Int)
(assert (= n86 (+ n81 n82)))
(declare-fun n87 () Int)
(assert (= n87 (* n4 n33)))
(declare-fun n88 () Int)
(assert (= n88 (* n5 n34)))
(declare-fun n89 () Int)
(assert (= n89 (+ n87 n88)))
(declare-fun n90 () Int)
(assert (= n90 (+ n3 n89)))
(declare-fun n91 () Int)
(assert (= n91 (* n4 n43)))
(declare-fun n92 () Int)
(assert (= n92 (* n5 n45)))
(declare-fun n93 () Int)
(assert (= n93 (* n4 n44)))
(declare-fun n94 () Int)
(assert (= n94 (* n5 n46)))
(declare-fun n95 () Int)
(assert (= n95 (+ n91 n92)))
(declare-fun n96 () Int)
(assert (= n96 (+ n93 n94)))
(declare-fun n97 () Int)
(assert (= n97 (* n1 n15)))
(declare-fun n98 () Int)
(assert (= n98 (* n2 n16)))
(declare-fun n99 () Int)
(assert (= n99 (+ n97 n98)))
(declare-fun n100 () Int)
(assert (= n100 (+ n0 n99)))
(declare-fun n101 () Int)
(assert (= n101 (* n1 n17)))
(declare-fun n102 () Int)
(assert (= n102 (* n2 n19)))
(declare-fun n103 () Int)
(assert (= n103 (* n1 n18)))
(declare-fun n104 () Int)
(assert (= n104 (* n2 n20)))
(declare-fun n105 () Int)
(assert (= n105 (+ n101 n102)))
(declare-fun n106 () Int)
(assert (= n106 (+ n103 n104)))
(declare-fun n107 () Int)
(assert (= n107 (* n95 n15)))
(declare-fun n108 () Int)
(assert (= n108 (* n96 n16)))
(declare-fun n109 () Int)
(assert (= n109 (+ n107 n108)))
(declare-fun n110 () Int)
(assert (= n110 (+ n90 n109)))
(declare-fun n111 () Int)
(assert (= n111 (* n95 n17)))
(declare-fun n112 () Int)
(assert (= n112 (* n96 n19)))
(declare-fun n113 () Int)
(assert (= n113 (* n95 n18)))
(declare-fun n114 () Int)
(assert (= n114 (* n96 n20)))
(declare-fun n115 () Int)
(assert (= n115 (+ n111 n112)))
(declare-fun n116 () Int)
(assert (= n116 (+ n113 n114)))
(declare-fun n117 () Int)
(assert (= n117 (* n1 n73)))
(declare-fun n118 () Int)
(assert (= n118 (* n2 n74)))
(declare-fun n119 () Int)
(assert (= n119 (+ n117 n118)))
(declare-fun n120 () Int)
(assert (= n120 (+ n0 n119)))
(declare-fun n121 () Int)
(assert (= n121 (* n1 n83)))
(declare-fun n122 () Int)
(assert (= n122 (* n2 n85)))
(declare-fun n123 () Int)
(assert (= n123 (* n1 n84)))
(declare-fun n124 () Int)
(assert (= n124 (* n2 n86)))
(declare-fun n125 () Int)
(assert (= n125 (+ n121 n122)))
(declare-fun n126 () Int)
(assert (= n126 (+ n123 n124)))
(assert (>= n110 n120))
(assert (>= n115 n125))
(assert (>= n116 n126))
(declare-fun n127 () Int)
(assert (= n127 (* n105 n53)))
(declare-fun n128 () Int)
(assert (= n128 (* n106 n54)))
(declare-fun n129 () Int)
(assert (= n129 (+ n127 n128)))
(declare-fun n130 () Int)
(assert (= n130 (+ n100 n129)))
(declare-fun n131 () Int)
(assert (= n131 (* n105 n63)))
(declare-fun n132 () Int)
(assert (= n132 (* n106 n65)))
(declare-fun n133 () Int)
(assert (= n133 (* n105 n64)))
(declare-fun n134 () Int)
(assert (= n134 (* n106 n66)))
(declare-fun n135 () Int)
(assert (= n135 (+ n131 n132)))
(declare-fun n136 () Int)
(assert (= n136 (+ n133 n134)))
(declare-fun n137 () Int)
(assert (= n137 (* n95 n9)))
(declare-fun n138 () Int)
(assert (= n138 (* n96 n10)))
(declare-fun n139 () Int)
(assert (= n139 (+ n137 n138)))
(declare-fun n140 () Int)
(assert (= n140 (+ n90 n139)))
(declare-fun n141 () Int)
(assert (= n141 (* n95 n11)))
(declare-fun n142 () Int)
(assert (= n142 (* n96 n13)))
(declare-fun n143 () Int)
(assert (= n143 (* n95 n12)))
(declare-fun n144 () Int)
(assert (= n144 (* n96 n14)))
(declare-fun n145 () Int)
(assert (= n145 (+ n141 n142)))
(declare-fun n146 () Int)
(assert (= n146 (+ n143 n144)))
(assert (>= n130 n140))
(assert (>= n135 n145))
(assert (>= n136 n146))
(declare-fun n147 () Int)
(assert (= n147 (* n83 n15)))
(declare-fun n148 () Int)
(assert (= n148 (* n84 n16)))
(declare-fun n149 () Int)
(assert (= n149 (* n85 n15)))
(declare-fun n150 () Int)
(assert (= n150 (* n86 n16)))
(declare-fun n151 () Int)
(assert (= n151 (+ n147 n148)))
(declare-fun n152 () Int)
(assert (= n152 (+ n149 n150)))
(declare-fun n153 () Int)
(assert (= n153 (+ n73 n151)))
(declare-fun n154 () Int)
(assert (= n154 (+ n74 n152)))
(declare-fun n155 () Int)
(assert (= n155 (* n83 n17)))
(declare-fun n156 () Int)
(assert (= n156 (* n84 n19)))
(declare-fun n157 () Int)
(assert (= n157 (* n83 n18)))
(declare-fun n158 () Int)
(assert (= n158 (* n84 n20)))
(declare-fun n159 () Int)
(assert (= n159 (* n85 n17)))
(declare-fun n160 () Int)
(assert (= n160 (* n86 n19)))
(declare-fun n161 () Int)
(assert (= n161 (* n85 n18)))
(declare-fun n162 () Int)
(assert (= n162 (* n86 n20)))
(declare-fun n163 () Int)
(assert (= n163 (+ n155 n156)))
(declare-fun n164 () Int)
(assert (= n164 (+ n157 n158)))
(declare-fun n165 () Int)
(assert (= n165 (+ n159 n160)))
(declare-fun n166 () Int)
(assert (= n166 (+ n161 n162)))
(declare-fun n167 () Int)
(assert (= n167 (* n43 n33)))
(declare-fun n168 () Int)
(assert (= n168 (* n44 n34)))
(declare-fun n169 () Int)
(assert (= n169 (* n45 n33)))
(declare-fun n170 () Int)
(assert (= n170 (* n46 n34)))
(declare-fun n171 () Int)
(assert (= n171 (+ n167 n168)))
(declare-fun n172 () Int)
(assert (= n172 (+ n169 n170)))
(declare-fun n173 () Int)
(assert (= n173 (+ n33 n171)))
(declare-fun n174 () Int)
(assert (= n174 (+ n34 n172)))
(declare-fun n175 () Int)
(assert (= n175 (* n43 n43)))
(declare-fun n176 () Int)
(assert (= n176 (* n44 n45)))
(declare-fun n177 () Int)
(assert (= n177 (* n43 n44)))
(declare-fun n178 () Int)
(assert (= n178 (* n44 n46)))
(declare-fun n179 () Int)
(assert (= n179 (* n45 n43)))
(declare-fun n180 () Int)
(assert (= n180 (* n46 n45)))
(declare-fun n181 () Int)
(assert (= n181 (* n45 n44)))
(declare-fun n182 () Int)
(assert (= n182 (* n46 n46)))
(declare-fun n183 () Int)
(assert (= n183 (+ n175 n176)))
(declare-fun n184 () Int)
(assert (= n184 (+ n177 n178)))
(declare-fun n185 () Int)
(assert (= n185 (+ n179 n180)))
(declare-fun n186 () Int)
(assert (= n186 (+ n181 n182)))
(assert (>= n153 n173))
(assert (>= n154 n174))
(assert (>= n163 n183))
(assert (>= n164 n184))
(assert (>= n165 n185))
(assert (>= n166 n186))
(declare-fun n187 () Int)
(assert (= n187 (* n43 n53)))
(declare-fun n188 () Int)
(assert (= n188 (* n44 n54)))
(declare-fun n189 () Int)
(assert (= n189 (* n45 n53)))
(declare-fun n190 () Int)
(assert (= n190 (* n46 n54)))
(declare-fun n191 () Int)
(assert (= n191 (+ n187 n188)))
(declare-fun n192 () Int)
(assert (= n192 (+ n189 n190)))
(declare-fun n193 () Int)
(assert (= n193 (+ n33 n191)))
(declare-fun n194 () Int)
(assert (= n194 (+ n34 n192)))
(declare-fun n195 () Int)
(assert (= n195 (* n43 n63)))
(declare-fun n196 () Int)
(assert (= n196 (* n44 n65)))
(declare-fun n197 () Int)
(assert (= n197 (* n43 n64)))
(declare-fun n198 () Int)
(assert (= n198 (* n44 n66)))
(declare-fun n199 () Int)
(assert (= n199 (* n45 n63)))
(declare-fun n200 () Int)
(assert (= n200 (* n46 n65)))
(declare-fun n201 () Int)
(assert (= n201 (* n45 n64)))
(declare-fun n202 () Int)
(assert (= n202 (* n46 n66)))
(declare-fun n203 () Int)
(assert (= n203 (+ n195 n196)))
(declare-fun n204 () Int)
(assert (= n204 (+ n197 n198)))
(declare-fun n205 () Int)
(assert (= n205 (+ n199 n200)))
(declare-fun n206 () Int)
(assert (= n206 (+ n201 n202)))
(declare-fun n207 () Int)
(assert (= n207 (* n83 n9)))
(declare-fun n208 () Int)
(assert (= n208 (* n84 n10)))
(declare-fun n209 () Int)
(assert (= n209 (* n85 n9)))
(declare-fun n210 () Int)
(assert (= n210 (* n86 n10)))
(declare-fun n211 () Int)
(assert (= n211 (+ n207 n208)))
(declare-fun n212 () Int)
(assert (= n212 (+ n209 n210)))
(declare-fun n213 () Int)
(assert (= n213 (+ n73 n211)))
(declare-fun n214 () Int)
(assert (= n214 (+ n74 n212)))
(declare-fun n215 () Int)
(assert (= n215 (* n83 n11)))
(declare-fun n216 () Int)
(assert (= n216 (* n84 n13)))
(declare-fun n217 () Int)
(assert (= n217 (* n83 n12)))
(declare-fun n218 () Int)
(assert (= n218 (* n84 n14)))
(declare-fun n219 () Int)
(assert (= n219 (* n85 n11)))
(declare-fun n220 () Int)
(assert (= n220 (* n86 n13)))
(declare-fun n221 () Int)
(assert (= n221 (* n85 n12)))
(declare-fun n222 () Int)
(assert (= n222 (* n86 n14)))
(declare-fun n223 () Int)
(assert (= n223 (+ n215 n216)))
(declare-fun n224 () Int)
(assert (= n224 (+ n217 n218)))
(declare-fun n225 () Int)
(assert (= n225 (+ n219 n220)))
(declare-fun n226 () Int)
(assert (= n226 (+ n221 n222)))
(assert (>= n193 n213))
(assert (>= n194 n214))
(assert (>= n203 n223))
(assert (>= n204 n224))
(assert (>= n205 n225))
(assert (>= n206 n226))
(assert (or (> n110 n120) (> n130 n140)))
(check-sat)
(exit)