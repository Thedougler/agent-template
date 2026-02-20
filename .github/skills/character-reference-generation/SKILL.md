---
name: "character-reference-generation"
description: "Visual character consistency generation across multiple professional scenarios and poses"
---

# Character Reference Generation Skill

**Domain**: Visual character consistency across multiple professional scenarios using AI image generation

## Purpose

Generate consistent visual reference images for book characters across diverse scenarios, poses, and contexts. This skill creates professional reference sets that maintain character identity while showcasing them in various narrative-appropriate situations.

## Core Knowledge

### Character Reference Requirements

**Consistency Factors**:
- Physical appearance (hair, features, build, age)
- Style/aesthetic (noir detective, fantasy, contemporary)
- Character essence (personality visible through expression/posture)
- Narrative context (professional scenarios, story settings)

**Variation Factors**:
- Poses (standing, sitting, gesturing, action-specific)
- Attire (scenario-appropriate clothing)
- Environment (setting, lighting, atmosphere)
- Mood/emotion (character state)

### AI Image Generation Best Practices

**Flux 1.1 Pro Documentation Insights**:
- `image_prompt` parameter = **Flux Redux composition guidance** (NOT character consistency)
- `prompt_strength` parameter does NOT exist in Flux 1.1 Pro API
- Character consistency achieved through **detailed text descriptions**
- Pose variation requires **explicit pose descriptions** in prompt

**Prompt Structure**:
```
{CHARACTER_DESC}, {attire}, {scenario}, {pose}, {environment}, {lighting}, {mood}, {STYLE_BASE}
```

**Anti-Patterns**:
- ❌ Using image reference + vague prompts = repetitive poses
- ❌ Assuming `image_prompt` provides character consistency
- ❌ Generic pose descriptions = same pose repeated

**Correct Approach**:
- ✅ Detailed character description in text
- ✅ Specific pose per scenario ("leaning forward analyzing data", "standing gesturing toward display")
- ✅ No image reference unless using Flux Redux for composition

### Character-Agnostic Workflow

**Input Requirements**:
1. Character profile (characters/{name}.md)
2. Style guide (prompt templates)
3. Scenario list (appropriate to character's narrative role)
4. Output directory structure

**Script Structure**:
```javascript
// Configuration
const CHARACTER = {
  name: "Character Name",
  description: "detailed appearance from profile",
  age: number
};

const STYLE = "aesthetic appropriate to narrative";

const SCENARIOS = [
  // Array of scenario objects with:
  // - id, title, scenario, attire, pose, environment, lighting, mood
];

const OUTPUT_DIR = `assets/character-reference/{character-slug}/{collection-name}`;
```

### Character-Specific Adaptations

**Alex** (21, detective noir, professional):
- Corporate/tech/investigation scenarios
- Navy/charcoal suits, casual professional
- Monitor glow, noir shadows, dramatic lighting

**Iris** (13, Wonderland native, fantasy):
- Garden/magic/Wonderland scenarios
- Living plant clothing, iridescent features
- Soft pastels, magical glow, nature lighting

**Maya** (15-16, contemporary teenager):
- School/social/casual scenarios
- Contemporary teen fashion
- Natural daylight, casual environments

**Mom/Bell-keeper/Shimmer**:
- Role-appropriate scenarios
- Character-specific styling
- Context-matched environments

## Implementation Steps

### 1. Extract Character Profile
```javascript
// Read characters/{name}.md
// Parse: physical description, age, personality, role
// Build CHARACTER_DESC constant
```

### 2. Define Style Base
```javascript
// Match narrative aesthetic
// Alex → "professional anime illustration, detective noir"
// Iris → "fantasy illustration, magical wonderland aesthetic"
// Maya → "contemporary anime illustration, slice-of-life realistic"
```

### 3. Create Scenario List
```javascript
// 15-20 scenarios
// Each with: id, title, scenario, attire, pose, environment, lighting, mood
// Scenarios match character's narrative role
```

### 4. Configure Output
```javascript
// Directory: assets/character-reference/{character-slug}/{style-variant}
// Naming: {id}.png (e.g., "01-scenario-name.png")
// Report: generation-report.json
```

### 5. Generate Images
```javascript
// For each scenario:
//   Build prompt = CHARACTER_DESC + scenario details + STYLE_BASE
//   Call Replicate API with text-only prompt
//   Handle rate limiting with exponential backoff
//   Save image and metadata
```

### 6. Validate Results
- Visual consistency check across set
- Pose variety confirmation
- Style adherence verification
- Report success/failures

## Success Metrics

**Consistency**:
- Same character recognizable across all images
- ✅ Facial features match
- ✅ Hair color/style consistent
- ✅ Build/age appropriate

**Variety**:
- No duplicate poses
- ✅ Different body positions
- ✅ Varied hand gestures
- ✅ Diverse scenarios/settings

**Quality**:
- Professional illustration quality
- ✅ Clear details
- ✅ Proper lighting/atmosphere
- ✅ Style consistency

**Efficiency**:
- 100% success rate (all scenarios generated)
- Minimal retries (rate limit handling)
- Cost tracking ($0.04/image)

## Common Issues & Solutions

**Issue**: Same pose in all images
**Cause**: Using image_prompt without detailed pose descriptions
**Solution**: Remove image_prompt, add explicit pose details to text prompt

**Issue**: Character looks different across images
**Cause**: Vague character description
**Solution**: Detailed, consistent character description in every prompt

**Issue**: Rate limit errors
**Cause**: Too many concurrent requests
**Solution**: 2s delay between requests + exponential backoff retry

**Issue**: Wrong style aesthetic
**Cause**: Style not matching character's narrative
**Solution**: Define STYLE_BASE appropriate to character (noir/fantasy/contemporary)

## Resources

### Documentation
- Flux 1.1 Pro: https://replicate.com/black-forest-labs/flux-1.1-pro
- Flux Redux (image_prompt): For composition guidance only
- Character profiles: characters/*.md

### Examples
- Alex professional noir: assets/character-reference/alex/professional-noir-scenes-v2/
- Script template: scripts/generate-noir-professional-scenes.js

### Cost
- Model: black-forest-labs/flux-1.1-pro
- Rate: $0.04 per image
- Typical set: 17 images = $0.68

## Synaptic Connections

### Related Skills
- [.github/skills/creative-writing/SKILL.md] (High, Integrates) - "Character consistency in narrative"
- [.github/skills/wonderland-worldbuilding/SKILL.md] (Medium, Enables) - "Visual representation of settings"
- [.github/skills/book-character-engine/SKILL.md] (Critical, Bidirectional) - "Character profile source"

### When to Activate
- "Generate character reference images for {character}"
- "Create visual reference set"
- "Need consistent character illustrations"
- Before illustration work requiring character consistency

### What This Enables
- Consistent character illustrations for chapters
- Cover art with accurate character depiction
- Marketing materials with recognizable characters
- Character design documentation
