# LOVALIS V-GATE SIMULATOR (V1.0)
# Principle: Decision is valid only if T ∩ O ∩ E pass. [cite: 168]

def v_gate_check():
    print("--- LOVALIS V-GATE DECISION MATRIX ---")
    
    # T-Check: Technical/Physical 
    t = input("1. Ist es technisch/physisch machbar? (y/n): ").lower() == 'y'
    
    # O-Check: Operational/ROI 
    o = input("2. Ist der Aufwand (Zeit/Energie) den Nutzen wert? (y/n): ").lower() == 'y'
    
    # E-Check: Ethical/L-Metric 
    e = input("3. Ist es fair und minimiert es das Leid (L_inc = 0)? (y/n): ").lower() == 'y'
    
    if t and o and e:
        print("\n[V-GATE STATUS: TRUE] - Durchführung empfohlen. Die Entscheidung ist systemkonform.")
    else:
        reasons = []
        if not t: reasons.append("Physischer/Technischer Bruch")
        if not o: reasons.append("Operative Ineffizienz (Entropie)")
        if not e: reasons.append("Ethischer Bruch (Leid-Gefahr)")
        print(f"\n[V-GATE STATUS: STOP] - Blockiert wegen: {', '.join(reasons)}.")

if __name__ == "__main__":
    v_gate_check()